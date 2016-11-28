From: Damjan Marion <damjan.marion@gmail.com>
Date: Mon, 28 Nov 2016 22:24:20 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <20161128221339.564e219f@free-electrons.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
 <8D43E2E0-8E99-4D96-8323-E1F360077FD4@gmail.com>
 <20161128221339.564e219f@free-electrons.com>
Message-ID: <B12CF9A8-74C8-438D-8DB3-9AB9E45F91FD@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 28 Nov 2016, at 22:13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Mon, 28 Nov 2016 22:08:04 +0100, Damjan Marion wrote:
> 
>>> Could you split the bump and the version fix reporting in two separate
>>> patches?  
>> 
>> ack
> 
> Thanks!
> 
>>>> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
>>>> +TVHEADEND_VERSION = v4.1-2345-g04ff649  
>>> 
>>> Please keep this as a full hash, like it used to be. It should still  
>> 
>> May I ask for reason? Just for my curiosity...
> 
> Because we're using a full hash in every other package fetched from Git
> in Buildroot, and we like consistency :)

Unfortunately that was only meaningful way (I?m aware of) to provide some
human-readable version information out from their repo.

> 
>>> work fine with the version reporting, if you write this version to
>>> $(@D)/rpm/version, like you're doing below.  
>> 
>> Are you suggesting here that tvheadend about page should just report 
>> ?50a370707aedf5c127e92bb517c378aa8ac04657? as a version?
> 
> Yes, exactly.

I don't see how is this improvement compared to ?0.0.0~unknown?. I really doubt
that it is worth time to submit that as a patch?.

What about something like:

TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
TVHEADEND_PRETTY_VERSION = v4.1-2345-g50a3707  

Thanks,

Damjan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 1600 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161128/c79a3ba3/attachment.p7s>
