From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 11:40:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
In-Reply-To: <0707091121270.8319@somehost>
References: <20070709045947.D862330066@busybox.net>
	<0707091002300.8319@somehost> <20070709091324.GB19774@aon.at>
	<0707091121270.8319@somehost>
Message-ID: <20070709094027.GB20627@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 09, 2007 at 11:32:07AM +0200, Cristian Ionescu-Idbohrn wrote:
>On Mon, 9 Jul 2007, Bernhard Fischer wrote:
>
>
>> No. Fix your BR2_WGET instead:
>> BR2_WGET="wget --passive-ftp"
>>
>> PS: sounds a bit like you did a source-check and forgot to reinstate
>> your sane config afterwards.
>
>BR2_WGET in my .config is set to this:
>
>BR2_WGET="wget --passive-ftp -nd"
>
>and I did not do it myself (it was supplied as default) AFAIR.
>
>The I might have understood this target in the main Makefile:
>
>.config.check: dependencies
>	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
>	touch $@
>
>and I might still failing to understand it, but it's one thing to
>temporarilly change BR2_WGET to do the checks and another thing to
>force edit .config behind my back.
>
>Could you please explain?

$ svn log -r18769  
------------------------------------------------------------------------
r18769 | aldot | 2007-06-07 14:57:03 +0200 (Thu, 07 Jun 2007) | 5 lines

- provide a "source-check" target that tries to download all packages
  with
  wget's spider-mode (i.e. just see if the server says the file is there without
  actually downloading the files.
  Convenient to check for unavailable source-packages.

------------------------------------------------------------------------

This is ment for developers who want to check for unavailable packages.
If you're uncomfortable with it, Don't Do That Then. And no, i don't
bother to save the config away. That's your duty (you most likely also
don't want to set all and every config option to yes for a real rootfs).

friendly,
