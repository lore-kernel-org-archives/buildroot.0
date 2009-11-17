From: Hedwin Koning <hedwin.koning@gmail.com>
Date: Tue, 17 Nov 2009 02:41:09 +0100
Subject: [Buildroot] UDEV Card reader
In-Reply-To: <f5ba0ddf0910221738h66f41585s5c9236b24ac59829@mail.gmail.com>
References: <f5ba0ddf0910221738h66f41585s5c9236b24ac59829@mail.gmail.com>
Message-ID: <4B01FF35.5080902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pablo Trujillo wrote:
> Hi everyone this is my first post I don't know if is correct to ask
> this here, My natural idiom is not  English so sorry for mistakes:
>
> I was working with the buildroot around one year  and I'm very glad
> for all its benefits to make a real small custom system.
>
> Im trying with the udev system (no the mdev that come with busybox).
> But the thing is that i don't understand why no work with card readers
> I was searching in google and I found this:
>
> http://shallowsky.com/blog/linux/udev-cardreaders-update.html
>
> I try that but nothing happen, I don't know why.
>
> if I put the compact flash and later I insert the reader , the system
> detect the card, but if I plug first the reader and after I put the
> CF, nothing happen, I mean the plug & unplug event seem not to work.
>
> If anyone can help me
>
> by the way :X86 architecture.
>
> regards
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>   
Hi

The problem with cardreaders is is that when memory cards are inserted 
after the
cardreader itself is inserted no events are sent to the kernel by the 
cardreader. To
solve this you need
to run  a background process that monitors insertion and removals of 
memory cards. The
background process repeatingly tries to open the devices of the 
cardreader. Once it does
the normal events (add, remove) are sent by the kernel which can be 
handled by either
udev of mdev.
In linux HAL takes care of this. If you try it on a linux machine you 
can see the background
processes using ps. Once you have the process names you can easily find 
them back in the
HAL source code.

Hedwin Koning.
