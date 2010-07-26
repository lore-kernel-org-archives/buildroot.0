From: Damien Borie <dbe@terawatt.fr>
Date: Mon, 26 Jul 2010 17:49:46 +0200
Subject: [Buildroot] Buildroot licence for commercial product
In-Reply-To: <20100726134259.2e2f5fc9@surf>
References: <4C4D5B7F.7020606@terawatt.fr> <20100726134259.2e2f5fc9@surf>
Message-ID: <4C4DAE9A.4030402@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, thanks for your answers.

I have read this today, and I've made a list of all package in my 
buildroot tree. I'm sure some of them are not installed, or not used,, 
because they where selected for some tests and never deleted...
So I got 9 package under ISC and 3 under BSD which only need to include 
the licence text. Then 3 under BSD which need an acknowledgement. Zlib 
and OpenSSL got special licences which need acknowledgements too.
2 LGPL which need the licence text, and one of them (QT) needs to allow 
to modify QT version.
And finally 13 GPL, 10 without Buildroot ncurses and fakeroot, which 
need to give access to the source code.
Ho, and mgetty for which I don't find the licence...
And, I forget all X11 packages...Xserver Xorg is under BSD-like 
licences, so I can just put the text. But I didn't look for all the sub 
packages and libraries...

I don't know how I will give access to all licences text, copyright, and 
source code, as the system is closed and nobody can connect to it except 
us...

Thank you for your help.

Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE 

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11 



Thomas Petazzoni a ?crit :
> Hello Damien,
>
> Warning: I am not a lawyer. I am not a licensing expert.
>
> On Mon, 26 Jul 2010 11:55:11 +0200
> Damien Borie <dbe@terawatt.fr> wrote:
>
>   
>> We distribute a product which system is a Linux built with Buildroot.
>> I have some question about Buildroot use for a commercial product :
>> - as the system has been made with Buildroot, must I mention
>> Buildroot with a url, display the licence or something like that in
>> my application?
>>     
>
> As Buildroot by itself isn't distributed, my understanding is that the
> license doesn't require you to mention and distribute Buildroot
> together with your product.
>
> However, the GPL says (section 3) :
>
>  ?
> The source code for a work means the preferred form of the work for
> making modifications to it. For an executable work, complete source
> code means all the source code for all modules it contains, plus any
> associated interface definition files, plus the scripts used to control
> compilation and installation of the executable. 
>  ?
>
> And maybe we might see Buildroot as a part of the "scripts used to
> control compilation and installation" of other GPL executables (Linux
> kernel, Busybox and others).
>
> I think we already had this discussion on the Buildroot list sometime
> ago, and I think the consensus was that the main Buildroot contributors
> considered that there was no distribution of Buildroot when selling a
> product whose firmware was built using Buildroot and that consequently,
> mentionning Buildroot and distributing its source code wasn't required.
>
>   
>> - I saw in another thread, if I understood well, that I must mention 
>> licence and source code for all modules of the distribution. But what 
>> does it means exactly? Must I put in my product file system every
>> source code and licence of every installed programs? Must I put a
>> visible link in my main application or can I only put everything in
>> the file system without a clear access?
>>     
>
> It depends on the individual license of each of the modules in your
> distribution. There will probably be GPL parts, LGPL parts, MIT/X11/BSD
> parts and parts under other licenses. Each license has its own set of
> requirements associated to the act of distribution.
>
> Generally speaking, for a GPLv2 module such as the Linux kernel or
> Busybox, the requirements are well detailed in section 3 of the licence
> (see http://www.gnu.org/licenses/old-licenses/gpl-2.0.html). You may
> also be interested by the "Distribution of programs released under the
> GNU licenses" section of the GPL FAQ, at
> http://www.gnu.org/licenses/gpl-faq.html. You may also want to have a
> look at the Practical Guide to GPL Compliance
> <http://www.softwarefreedom.org/resources/2008/compliance-guide.html>.
>
> In terms of distribution, the LGPL license have fairly similar
> requirements to the GPL. MIT/X11/BSD and other non-copyleft licenses
> have fewer requirements, they basically only require attribution.
>
> Thomas
>   
