From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Aug 2015 12:32:54 +0100
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
In-Reply-To: <55DDA318.2050008@imgtec.com>
References: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150826090804.GG8919@tarshish> <55DD824B.6030700@imgtec.com>
 <20150826103248.GH8919@tarshish> <55DD9D29.6090308@imgtec.com>
 <20150826111255.GI8919@tarshish> <55DDA318.2050008@imgtec.com>
Message-ID: <55DDA3E6.1030902@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 08/26/2015 12:29 PM, Vicente Olivert Riera wrote:
> I think just "--libs openssl" is better since it seems to act
> recursively

look at this snippet from config.log:

ac_cv_env_LIBS_value='-lssl
-L/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr//lib
-lcrypto -lz  '

So, it does recursion.

Regards,

Vincent.
