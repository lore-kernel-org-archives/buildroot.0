From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:09:19 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
 <20180909141612.43915a59@windsurf.home>
 <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
Message-ID: <20180909150919.546beda4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Sep 2018 14:43:41 +0200, Fabrice Fontaine wrote:

> Because the last time I tried to use pkg-config, the upstream project
> decided to refuse the merge request and use ac_search_libs instead:
> https://gitlab.com/muttmua/mutt/merge_requests/25 :-(

I think in such cases, we should propose a patch that uses pkg-config
if available, and if not falls back to AC_CHECK_LIB or other macros. If
pkg-config is available, then static linking will work, if not, it will
continue to fail like it used to.

> I know that netsnmp is already using pkg-config, but only for libnl perhaps
> they would agree to use it also for ssl. I'll ask them and if they agree
> I'll update my patch.

Sure. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
