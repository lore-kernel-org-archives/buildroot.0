From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 18:15:48 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.17
In-Reply-To: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130108181548.113e00bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  4 Jan 2013 17:42:15 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnl/libnl.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

libnl is causing a recurrent build failure:

  CC     netfilter/exp_obj.lo
netfilter/exp_obj.c: In function 'exp_dump_details':
netfilter/exp_obj.c:271:23: error: 'NF_CT_EXPECT_PERMANENT' undeclared (first use in this function)
netfilter/exp_obj.c:271:23: note: each undeclared identifier is reported only once for each function it appears in
netfilter/exp_obj.c:273:23: error: 'NF_CT_EXPECT_INACTIVE' undeclared (first use in this function)
netfilter/exp_obj.c:275:23: error: 'NF_CT_EXPECT_USERSPACE' undeclared (first use in this function)

See:

  http://autobuild.buildroot.org/results/28f23910e2c2090e6f37e8d6a26cdb5adf9615c2/
  http://autobuild.buildroot.org/results/b8d0b9e7d5ea3a8f3c4ba29faeee0434ea5a1111/

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
