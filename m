From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 23 Jan 2009 12:16:05 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
	<5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	<877i4no5n7.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
	<87zlhjml3m.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
	<87sknbmjj4.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
Message-ID: <1232709365.6350.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-22 at 20:12 +0100, Stridh, Robin ActeSE wrote:

> Seems I've been searching a dead end. I compared the configurations
> and
> found that I had Target ABI set to EABI, but Ulf has used OABI in
> at91sam9263ek_defconfig. When selecting OABI the login works for all
> versions I have tried, including r24966 from today.
> 
> I know I have selected EABI in buildroot sucessfully in the past and
> my kernel
> is built to support both. Now I have no idea when this thing broke -
> probably
> months ago.

Most probably you have run into a similar problem as the one that Daniel
Mack described last week on this list. In the end it turned out that we
had configured gcc with the wrong target name. This resulted in gcc
producing OABI binaries even though EABI was selected in buildroot. See
my mail from 20 Jan 2009 where I suggest that buildroot should try
harder to make sure that the gcc target suffix is set correctly.


Sven
