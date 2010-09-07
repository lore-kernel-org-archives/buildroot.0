From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Sep 2010 21:04:20 +0000 (UTC)
Subject: [Buildroot] OT: how to do upgrades with ipkg?
References: <i6680v$ahj$1@dough.gmane.org> <4C86A6D0.7070602@jdines.net>
Message-ID: <i669ck$glk$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-09-07, James J. Dines <jdines@jdines.net> wrote:
>
> On 09/07/2010 04:41 PM, Grant Edwards wrote:
>> First, my apologies.  This isn't directly related to buildroot, but
>> I'm hoping somebody might know the answer (there doesn't seem to be an
>> ipkg mailing list).
>> 
>> When using ipkg to manage field-installed pacakges, how do you upgrade
>> a package?  For example, let's say I've got foobar version 0.1
>> installed.  Now I have foobar_0.2_arm.ipk at hand on the target.  How
>> do I upgrade?
>> 
>> The "ipkg upgrade" command doesn't seem relevent -- it won't accept a
>> path to an .ipk file.  There are no "feeds" in my system.  All packages
>> are explicitly uploaded to the target and installed.
>> 
>> Do you just do this?
>> 
>>   ipkg remove foobar
>>   ipkg install foobar_0.2_arm.ipk

Apparently you just "install" the new package.  ipkg figures out that
an older version is installed and knows it's upgrading.

> On a related note, wouldn't it make more sense to migrate to opkg at
> this point?  http://en.wikipedia.org/wiki/Opkg

Probably.

Development on ipkg seems to have stalled.  The newest snapshot
available from handhelds.org is from 2006.

The last commit to the opkg SVN reposity was about two weeks ago.

-- 
Grant Edwards               grant.b.edwards        Yow! Uh-oh!!  I'm having
                                  at               TOO MUCH FUN!!
                              gmail.com            
