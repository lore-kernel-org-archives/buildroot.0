From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:09:26 +0200
Subject: [Buildroot] [PATCH] argp-standalone: restrict value range
 passed to isprint function
In-Reply-To: <1430211036-4123-1-git-send-email-jcmvbkbc@gmail.com>
References: <1430211036-4123-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150501110926.5fc52365@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 28 Apr 2015 11:50:36 +0300, Max Filippov wrote:
> According to C standards isprint argument shall be representable as an
> unsigned char or be equal to EOF, otherwise the behaviour is undefined.
> 
> Passing arbitrary ints leads to segfault in nm program from elfutils.
> 
> Restrict isprint argument range to values representable by unsigned char.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/argp-standalone/0002-isprint.patch | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/argp-standalone/0002-isprint.patch

Applied, thanks. I've added a reference to the corresponding glibc
commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
