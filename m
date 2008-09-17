From: =?ISO-8859-1?Q?St=E9phane?= Mancini <stephane.mancini@grenoble-inp.fr>
Date: Wed, 17 Sep 2008 12:48:26 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <873ak07x9m.fsf@macbook.be.48ers.dk>
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
Message-ID: <1221648506.30276.10.camel@chip.lis.inpg.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Peter,
Yes, you're right the driver works correctly.

The behavior of busybox is very strange :
the main of appletlib.c sometime stops before doing anything. The prompt
I've inserted don't appear : they could be not reached or never
displayed ...
Is there a way to trace the shell running ?


Do you mind to send me a configuration file for a ML405 board that
works ?

Greetings

St?phane


Le mardi 16 septembre 2008 ? 20:37 +0200, Peter Korsgaard a ?crit :
> >>>>> "St?phane" == St?phane Mancini <stephane.mancini@grenoble-inp.fr> writes:
> 
>  St?phane> Hi,
>  St?phane> I'm trying to set up linux on a Xilinx platform.
>  St?phane> The boot starts but the root login fails 
>  St?phane> after prompting :
> 
> 
> Probably you have CONFIG_FEATURE_SECURETTY enabled in busybox and
> haven't added ttyUL0 to /etc/securetty.
> 
> I'll add it to securetty of target/generic shortly.
> 
>  St?phane> I'm using the Xilinx UARTLITE and the driver comming with
>  St?phane> linux 2.6.26.2
> 
> My driver afaik works correctly.
> 
-- 
|St?phane Mancini   Ma?tre de Conference ENSIMAG/GIPSA-lab DIS
| Tel : 04 76 57 43 58
| 961 rue de la Houille Blanche
| Domaine universitaire - BP 46
| 38402 Saint Martin d'H?res cedex
| Email : stephane.mancini at grenoble-inp.fr
| http://www.lis.inpg.fr/pages_perso/mancini
================================================
Join us for the DASIP'08 Conference
ULB, Bruxelles, Belgique
Visit http://www.ecsi.org/dasip/
================================================
