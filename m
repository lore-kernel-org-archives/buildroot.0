From: Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Mon, 29 Feb 2016 13:51:47 +1100
Subject: [Buildroot] [PATCH] linux-firmware: Allow selection of bnx2x fw
	version
In-Reply-To: <CACPK8XeYeRYPdw1rjpYKW=XyQuw+X7fAn3Ds-RJC+zifJUjsjA@mail.gmail.com>
References: <1456461093-10202-1-git-send-email-joel@jms.id.au>
 <20160226093939.26819401@free-electrons.com>
 <CACPK8XeYeRYPdw1rjpYKW=XyQuw+X7fAn3Ds-RJC+zifJUjsjA@mail.gmail.com>
Message-ID: <874mcs9qkc.fsf@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel Stanley <joel@jms.id.au> writes:
> On Fri, Feb 26, 2016 at 7:09 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> I think adding new config to chose between different versions of a
>> given firmware is going a bit too far. If we were to do that for all
>> firmwares in linux-firmware, it would really increase the number of
>> Config.in options too much.
>
> Yeah, I do agree with this concern. It's unfortunate we don't have a
> variable we can test to see what the kernel version is.
>
>> Shall I suggest to install both versions of the firmware? The firmware
>> files are not that large, and if filesystem size is really a strong
>> issue, it is always possible to clean up the non-required firmware
>> files in a post-build script.
>
> In our case the extra ~640kB would be worth cleaning up. I like
> buildroot for the clean tiny images it produces; I think that's worth
> preserving.

Also, at some point we run out of room on flash.

-- 
Stewart Smith
OPAL Architect, IBM.
