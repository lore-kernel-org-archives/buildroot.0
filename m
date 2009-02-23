From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Feb 2009 10:42:26 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <49A268F5.5030300@carallon.com>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<49A268F5.5030300@carallon.com>
Message-ID: <20090223094226.GA15722@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 23, 2009 at 09:14:29AM +0000, Will Wagner wrote:
>> as pointed out in two threads on the alsa-dev ML, there seems to be
>> general problem with ALSA libraries built by buildroot:
>>
>> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
>> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/015005.html
>>
>> Any hints, anyone?
>
> Not sure if this is the same as a problem I was seeing with alsa-lib. It 
> was a while ago so not entirely sure. However I found my problem was to 
> do with the complicated alsa versioning API meaning that the wrong 
> version of the function was called. I fixed it by adding 
> --with-versioned="no" to the alsa-lib configure (I also moved to 1.0.19 
> as that had a number of bug fixes for other things I needed).

Aha, that fixed it for me, too. Thanks :)

Daniel
