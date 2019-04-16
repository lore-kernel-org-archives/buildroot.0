From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:31:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-15
In-Reply-To: <f6c8d29f-eb44-6b16-a94b-a09186c47c2b@micronovasrl.com>
References: <20190416060047.6838786EF6@hemlock.osuosl.org>
 <e6975dfa-1a60-c394-de64-2e11243181d2@micronovasrl.com>
 <20190416134438.246c63cf@windsurf>
 <f6c8d29f-eb44-6b16-a94b-a09186c47c2b@micronovasrl.com>
Message-ID: <20190416223115.1c314a13@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Apr 2019 17:18:54 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> So, if I don't understand wrong, when BR2_SYSTEM_ENABLE_NLS is disabled 
> we want all packages not to produce translation files.

Ideally yes.

> Then if a package tries anyway to produce translation files we need to 
> fix it by checking BR2_SYSTEM_ENABLE_NLS(depends on 
> !BR2_SYSTEM_ENABLE_NLS etc.) in its Config.in file.

I guess you wanted to say "if a package tries anyway to produce
translation files, we need to fix it by adding a depends on
BR2_SYSTEM_ENABLE_NLS". If that's what you meant, then I believe the
answer is no.

gettext-tiny provides some dummy implementation of the gettext tools,
so we can use these if a package really wants to generate translation
files despite BR2_SYSTEM_ENABLE_NLS being disabled. However, if there's
a reasonable way to tell the package to not generate translation files,
I'd say we should prefer that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
