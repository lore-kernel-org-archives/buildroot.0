From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 2 Apr 2019 06:48:06 +0200
Subject: [Buildroot] dl_dir problem with building using legal-info
In-Reply-To: <20190401174751.581e16a4@windsurf>
References: <9f90c933-8494-9a82-ab12-7f67873fda9e@ginzinger.com>
 <20190401174751.581e16a4@windsurf>
Message-ID: <dd7ab5ff-cddb-004d-19ef-506412a86313@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01.04.19 17:47, Thomas Petazzoni wrote:
> Martin,
> 
> On Mon, 1 Apr 2019 15:56:55 +0200
> Martin Kepplinger <martin.kepplinger@ginzinger.com> wrote:
> 
>> It seems like the plan might be to move from one "dl" directory
>> containing the tarballs, old_dl_dir, to the per-package directories in "dl".
>>
>> So: I reuse the tarballs in "legal-info" for building. (think: no
>> internet connection). legal-info contains directories *with versions*.
>> In any case, it's easy by finding all archives and copying them to "dl"
>> before building.
>>
>> If old_dl_dir would be removed from the download scripts, this would
>> break for me. The per-package directories in "dl" *don't contain
>> versions* and I guess there's no trivial way to recreate this directory
>> structure. So I thought I'd talk about this before old_dl_dir is gone...
>>
>> In short: Before removing to look in old_dl_dir, please don't break this
>> use-case :) Is there an even better way to build using legal-info that
>> I'm not aware of already? If not, what could we implement?
> 
> Why don't you use "make source" ? That's the intended target to
> populate the dl/ directory with everything that is needed to do a build
> with no internet connection.
> 

because I need (to package) legal-info (patches, configs and licenses
included) anyways. I would have to duplicate what legal-info does if I'd
switch to using the "dl" directory directly (as a starting point).

thanks

                                   martin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190402/453f9105/attachment.bin>
