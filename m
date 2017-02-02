From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Feb 2017 22:19:08 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-01-18
In-Reply-To: <20170120131817.382b2ac9@free-electrons.com>
References: <20170119072929.AFCF620C11@mail.free-electrons.com>
 <20170120003818.GA5114@tungsten.ozlabs.ibm.com>
 <20170120131817.382b2ac9@free-electrons.com>
Message-ID: <e3ea8933-3a86-a374-37b8-67f5aefb9675@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-01-17 03:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 20 Jan 2017 11:38:18 +1100, Sam Bobroff wrote:
> 
>>> This is the list of Buildroot build failures that occured on
>>> 2017-01-18, and for which you are a registered architecture developer
>>> or package developer. Please help us improving the quality of
>>> Buildroot by investigating those build failures and sending patches to
>>> fix them. Thanks!
>>>
>>> Build failures related to your architectures:  
>>
>> [snip]
>>
>>>    powerpc64 |                  openocd-0.9.0 | http://autobuild.buildroot.net/results/0640114028b1e633cefc682e8d6a8283a3a39019  
>>
>> Hi Thomas,
>>
>> I've had a look at the openocd failure, above, and while it's simple and
>> I have a patch for it, there might be something odd going on so I
>> thought I should ask you about it first.
>>
>> The failure is in the install stage, caused by the documentation being
>> regenerated from the .texi input, which fails. It's easy to fix by
>> tweaking the Makefile (actualy Makefile.in) as has been done on many
>> other packages... however, what I'm curious about is why the error is
>> showing up in the autobuilder in the first place.
>>
>> The file modification times in the package's archive seem to be correct:
>> $ ls openocd-0.9.0.orig/doc/openocd.{info,texi}
>> -rw-r--r-- 1 xxxx xxxx   3,542 2015-05-18 07:13:55.000000000 +1000
>> openocd-0.9.0.orig/doc/openocd.info
>> -rw-r--r-- 1 xxxx xxxx 354,589 2015-05-18 07:04:07.000000000 +1000
>> openocd-0.9.0.orig/doc/openocd.texi
>>
>> (And I can't replicate the autobuilder failure unless I touch the .texi
>> file.)

 Weird that you can't reproduce. At the end of the build step I see:

Making all in doc
Updating ./version.texi

and of course version.texi is a dependency of openocd.info.


 Regards,
 Arnout

>>
>> Is something you've seen before?  Could something on the autobuilder be
>> touching a file or otherwise confusing the timestamp?
>>
>> What I don't understand is how this particular file causes a
>> re-generation yet other files don't (e.g. Makefile.am would cause
>> regeneration of Makefile.in but that doesn't happen).
>>
>> Any ideas? Just send the patch?
> 
> I don't really have a good idea. I'm adding the Buildroot mailing list
> in Cc in case other folks have more ideas.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
