From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 27 Jul 2014 16:33:54 +0200
Subject: [Buildroot] [PATCH 2 of 2] generic packages: rename
	FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT
In-Reply-To: <20140727152223.38c38d68@free-electrons.com>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
 <5b961fc80eb2d23373a6.1406056892@localhost>
 <20140727152223.38c38d68@free-electrons.com>
Message-ID: <8527bc5f-ee03-47f0-9e7c-e44db77ba2c5@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>Dear Thomas De Schampheleire,
>
>On Tue, 22 Jul 2014 21:21:32 +0200, Thomas De Schampheleire wrote:
>> As FOO_MAKE_OPTS has been renamed to FOO_MAKE_OPT, this patch renames
>> FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT for symmetry reasons.
>> 
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> 
>> ---
>> Note: TARGET_CONFIGURE_OPTS has not been changed since the impact is very
>> large. It would make sense to change it too, though, so let me know what you
>> think.
>
>Yeah, I'm a bit worried with the discrepancy between
>TARGET_CONFIGURE_OPTS, TARGET_CONFIGURE_ARGS, HOST_CONFIGURE_OPTS and
>HOST_CONFIGURE_ARGS that use the plural form, vs those per-package
><foobar>_OPT options.
>
>My feeling is that the plural form looks more logical, so instead of
>moving from _OPTS to _OPT, I'd rather like to see a move from _OPT to
>_OPTS. But that indeed involves changing a *lot* of packages.

For me, the amount of touched packages is not important. We have done mass changes in the past, even for simple cleanup.

The question is: do we need to care about BR2_EXTERNAL users? Yann objected
 against this type of change with that argument.
My opinion is: no, we never declared that the infra is stable, so when updating to a 
newer Buildroot release may involve some changes to your external packages, just as
 was the case before BR2_EXTERNAL existed, for non-submitted packages of a
 company/project.

We could add a simple check to warn users of _OPT, but not more than that.

Best regards,
Thomas
