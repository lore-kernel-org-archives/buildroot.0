From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 25 Nov 2014 09:52:02 +0000
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <20141124203345.474d71b1@free-electrons.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>	<20141122193924.34aa21ec@free-electrons.com>	<5473042A.8020505@imgtec.com>
 <20141124203345.474d71b1@free-electrons.com>
Message-ID: <54745142.7040409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 11/24/2014 07:33 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 24 Nov 2014 10:10:50 +0000, Vicente Olivert Riera wrote:
> 
>> On 11/22/2014 06:39 PM, Thomas Petazzoni wrote:
>>> Dear Vicente Olivert Riera,
>>>
>>> On Fri, 21 Nov 2014 15:33:07 +0000, Vicente Olivert Riera wrote:
>>>
>>>> +LIBFM_EXTRA_VERSION = 1.2.3
>>>> +LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
>>>
>>> This is the exact same tarball as the one used for the libfm package:
>>>
>>> +LIBFM_VERSION = 1.2.3
>>> +LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
>>> +LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
>>>
>>> Why do we have two different packages? Is it because libfm full version
>>> needs menu-cache, and menu-cache needs libfm-extra?
>>
>> Yes, that is exactly the reason. Look for instance how is done in
>> LinuxFromScratch:
>>
>> http://www.linuxfromscratch.org/blfs/view/svn/lxde/libfm-extra.html
>>
>> They build libfm-extra first, then menu-cache and then libfm. I did
>> exactly the same.
> 
> And you didn't explain that anywhere in the commit logs? No comments
> about this in the code? If you want such non-obvious stuff to be merged
> one day, you should at least add a little bit of explanation about it.

If you want, I don't mind to respin my patches adding more information
about that. But please, don't say that there is zero information because
in the "help" message of the libfm-extra package I added a short text
saying that package is needed for menu-cache:

+	help
+	  The libfm-extra package contains a library and other files
+	  required by menu-cache-gen libexec of menu-cache-1.0.0

And also in the cover-letter:

http://lists.busybox.net/pipermail/buildroot/2014-November/112652.html

> This all seems a bit crazy. How are the pcmanfm people building their
> stuff?

They are building it in that way. First libfm-extra, then menu-cache,
then libfm and finally pcmanfm.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
