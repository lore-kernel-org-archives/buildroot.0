From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Wed, 30 May 2007 23:29:03 +0100
Subject: [Buildroot] ALSA for build root Part 2
In-Reply-To: <20070529200050.GA30684@aon.at>
References: <4656F77D.30303@teamboyce.co.uk> <465847FE.6050304@teamboyce.co.uk>
	<1180422192.32245.22.camel@localhost.localdomain>
	<20070529200050.GA30684@aon.at>
Message-ID: <465DFAAF.3030704@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Tue, May 29, 2007 at 09:03:12AM +0200, Hans-Christian Egtvedt wrote:
>   
>> On Sat, 2007-05-26 at 15:45 +0100, Rod Boyce wrote:
>>     
>>> Rod Boyce wrote:
>>>       
>
> Rod, care t osend an updated patch taking Hans-Christian's comments
> (thanks for those!) into account?
>
> TIA,
>
>   
All,

Attached is an updated patch that does not offend the sensibilities of 
other ALSA people working on build root.  This is just alsa-lib and 
alsa-utils I will send out a patch for more alsa stuff latter.  This 
outputs to $(STAGING_DIR)/usr/lib which on my build happens to be a link 
back to $(STAGING_DIR)/lib.  I have also removed the device links that I 
was putting in the dev directory I had not removed this since I switched 
over to udev.  Just --prefix=/usr did not fix all paths all of the time 
although I think that I have the minimum custom options for configure 
and install targets for both utilities and library makefile fragments 
now.  I also figured out what the "basename nonsense" was and while I 
approve of the intent I used a more makefile way of doing the same thing.

Hopefully this is a more acceptable patch, if anybody has some more 
suggestions then perhaps they would like to contribute their own ALSA 
patch's so we can either pick the best or merge and get the best of both 
worlds and produce a better build-root system.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa.patch
Type: text/x-patch
Size: 8564 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070530/bcc6f0ad/attachment.bin 
