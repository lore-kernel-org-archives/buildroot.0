From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 10 Oct 2014 12:45:28 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <20141010123449.04163d4c@free-electrons.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
 <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
 <20141009222020.5bd77d67@free-electrons.com>
 <CA+TH9VkiMj5PNJaO1k2fHpEbjY2mgCDO9NmQtny7T4GVPpYX0g@mail.gmail.com>
 <20141010123449.04163d4c@free-electrons.com>
Message-ID: <CA+TH9V=mCGn6WtS0RJHV9HHy6wrYBvxSW3aveQWdQWP-9UW0Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

> The fix is pretty simple: edit /etc/mono/config and change the line:
>
> <dllmap dll="libc" target="libc.so.6" os="!windows"/>
>
> to:
>
> <dllmap dll="libc" target="libc.so.0" os="!windows"/>

This is pretty wonderfull! I totally missed that! I'll include it in a
patch file! May it work also with glibc? If yes, I can tweak a static
version of that file to include.

>>If you think it's important, I can update my patch to offer a
>> selection of which mono version should be shipped into the target
>> folder, so reducing to the essential the libraries components.

> I believe this would be useful.

Great! I'll work on that!

>> Of course you can further shrink manually your mono installation by
>> delete libraries that you don't use, but this part is not easily
>> doable and it's an optimization step that only a software developer
>> can do basing on his software.

> Yes, that's more something left for a post-build script I believe.

Sure, the developer implementing his own software can write a script
to delete all the unneeded libraries.

> I don't think you understood my comment properly: I do not claim there
> is no need for a host package. I claim that you currently have your
> host package (mono-managed) separate for the target package
> (mono-native) and that this is not needed. They could be both in a
> single package called mono, where the host variant of the package
> builds the "managed" stuff, and the target variant builds the "native"
> stuff. I'll adjust your patch to see if it's indeed possible and if it
> is, I'll show you what it looks like.

Yes, Thomas, you caught me, I did not understand your comment!
Actually I really don't know haw to achieve such a dual package in
one, but if you prompt me a minimal example, I'll work on understand
it!

Thank you for your time!

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
