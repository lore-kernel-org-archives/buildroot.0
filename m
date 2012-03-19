From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 13:10:01 -0300
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <20120319165731.4d3374cd@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120319163011.27d669d2@skate>
 <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
 <20120319165731.4d3374cd@skate>
Message-ID: <d7ddbe9f7758337b5b2df80ad8b1fe18@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-19 12:57, Thomas Petazzoni wrote:

> Gustavo, your work on Perl is really appreciated, but I think it's 
> also
> fair to have a discussion on the pros and cons of various changes.
>
> I am completely in favor of a solution where host-microperl gets 
> built
> when microperl for the target is selected since as you say, it is the
> only solution to reliably build XS Perl modules for the target.
>
> However, I wanted us to *investigate* the potential solutions to 
> build
> host-microperl *only* when microperl for the target is selected, and
> not when we need a simple random utility such as intltool running on
> the host.
>
> Thomas

If someone wants perl modules/bindings for some package, and said 
package just accepts --with/without-perl and just searchs the PATH for 
perl, what would you do? (which is a pretty common scenario for non-CPAN 
stuff)
Renaming otherperl back to perl back and forth for this kind of 
packages? Changing the PATH for configure/make?
And most don't accept a --with-perl=otherperl syntax.
The solution is simple, rename it to some other thing, but you'll loose 
the possibility of many bindings/modules for packages, it's quite simple 
actually.
I won't submit a patch to do that though since i'm against the idea.
Regards.
