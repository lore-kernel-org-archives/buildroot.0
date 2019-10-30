From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:35:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix compilation with stub
 memfd_create
In-Reply-To: <20191022124148.30209-1-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Tue, 22 Oct 2019 14:41:48 +0200")
References: <20191022124148.30209-1-patrick.havelange@essensium.com>
Message-ID: <87ftja1keb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > This fixes compilation issue in case memfd_create is a stub in libc.
 > Patch already merged in lxc master branch
 > (344b8ee293f4d3730a70a6ccaa03d7e4a516ae95).

 > Copy of the original commit log:

 > In case the internal memfd_create has to be used, make sure we don't
 > clash with the already existing memfd_create function from glibc.

 > This can happen if this glibc function is a stub. In this case, at
 > ./configure time, the test for this function will return false, however
 > the declaration of that function is still available. This leads to
 > compilation errors.

 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
