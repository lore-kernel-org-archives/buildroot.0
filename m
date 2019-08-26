From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 26 Aug 2019 14:14:36 +0200
Subject: [Buildroot] New search features on autobuild.buildroot.org
In-Reply-To: <20190826114702.429a02d6@windsurf.home>
References: <20190820151106.4a1ffacf@windsurf.home>
 <87h86b7lyi.fsf@dell.be.48ers.dk> <20190826094933.5c5f2b5d@windsurf.home>
 <87y2zg2rpm.fsf@dell.be.48ers.dk> <20190826114702.429a02d6@windsurf.home>
Message-ID: <3a4543e6-9ea4-8980-923a-df56a51f61d2@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 26/08/2019 ? 11:47, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 26 Aug 2019 11:36:53 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>> It doesn't (firefox-esr 60.8.0esr-1~deb9u1), it ends up redirecting to:
>>
>> http://autobuild.buildroot.net/index.php?submitter=&reason=&arch=arm&subarch=&date%5Bfrom%5D=&symbols=BR2_PACKAGE_STRACE%3Dy&libc=&date%5Bto%5D=
>>
>> Retrying on chrome I do see that it works:
>>
>> http://autobuild.buildroot.org/index.php?arch=arm&symbols%5BBR2_PACKAGE_STRACE%5D=y
>>
>> It would be great if we could get it to work under Firefox as
>> well. I know next to nothing about Javascript, but shouldn't the
>> submitForm() function take an event argument? In the debugger console I
>> see:
>>
>> ReferenceError: event is not defined              search.js:3:5
> 
> It works here under Firefox 68.0 (64-bit), provided by Fedora.
> 
> Victor, do you think you could have a look ?
> 

I quickly looked at it looks like and passing the global 'event' object
to the function makes it work on the last est build of firefox. I've
send a patch.

Thanks for this feedback!

> Thanks,
> 
> Thomas
> 

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
