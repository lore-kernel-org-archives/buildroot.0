From: Scott Reese <sreese@indianaheart.org>
Date: Sun, 01 Oct 2006 15:00:17 -0400
Subject: [Buildroot] Problems with recent zcat changes
In-Reply-To: <20061001183736.GK17455@aon.at>
References: <452002A1.2020400@indianaheart.org> <20061001183736.GK17455@aon.at>
Message-ID: <45201041.9050907@indianaheart.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernhard Fischer wrote:
> On Sun, Oct 01, 2006 at 02:02:09PM -0400, Scott Reese wrote:
> Greetings:
> 
> I think that the zcat changes over the last few days have caused some
> problems in the makefile.  The newest buildroot fails to build the
> skeleton directories correctly.
> 
>> No idea why that hunk wasn't checked in.
> 
>> Added now as r16285, it looked like:
>> Index: package/Makefile.in
>> ===================================================================
>> --- package/Makefile.in	(revision 16280)
>> +++ package/Makefile.in	(working copy)
>> @@ -8,6 +8,8 @@
>>  #"
>>  SVN:=$(strip $(subst ",, $(BR2_SVN)))
>>  #"
>> +ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
>> +#"
>>  TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
>>  #"
> 
>> Ok now?
> The Makefile should be changed to reference BR2_ZCAT instead of ZCAT:
> 
> 107c107
> <               $(ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf -; \
> ---
>>>>               $(BR2_ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf
> -; \
> 
> -Scott

That seems to have fixed it.  Thanks.

- -Scott
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD4DBQFFIBAGS7FYdPX6+iYRAr9mAJ9GhU4UKlMrrEC0hTPRMDn2pTYzmwCWIbWm
xpcHj7rGhUNQZiYRipQuUQ==
=YSWs
-----END PGP SIGNATURE-----
