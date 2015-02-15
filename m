From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Feb 2015 13:32:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-13
In-Reply-To: <20150214224243.47b77b67@free-electrons.com>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
Message-ID: <54E091D7.9000801@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 14/02/2015 22:42, Thomas Petazzoni a ?crit :
> Hello,

> 
>>         bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6f30e976f307e2eca68abf7e379506e2754891ae/
>>         bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/73aa1c7a2946f878c246e4cfec64859e04aaced1/
> 
> I remember starting having a quick look, but I think I was not able to
> reproduce on my machine, for some reason.

Static build issue
http://patchwork.ozlabs.org/patch/439830/

> 
>>          arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/ee9ab4b54d6c1d2c774362d518c6c0055ec6e898/
>>          arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/d69a324434f370b490a53e6191d38a204ac28371/
>>          arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/79b004e42331c4b581f2d3ead7ebec0c316f29f8/
> 
> Romain Naour has said on IRC he was looking at these ones.
> 

Dependency/packaging build issue.
Libevas package needs to be reviewed for GLES2/gl2.h provider (messa3d...)

http://patchwork.ozlabs.org/patch/439806/
http://patchwork.ozlabs.org/patch/439808/
http://patchwork.ozlabs.org/patch/439807/

> 
>>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/71362af474461e99b7c188a316aa644a0faaad2e/
>>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/469eadc6a7aa81c13643b5c249a63cf11d8c3fc9/
>>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/1739ec14ce49a57d06a73d9164f42061ce80f203/
> 
> Not sure.
> 
Static build issue.
libwebsock can't find libevent_openssl.pc because libevent package silently fail
to enable openssl support although openssl support is explicitly requested.

Libevent:
checking for library containing SSL_new... no

no patch yet... or disable openssl support in libwebsock for static build.

Best regards,
Romain Naour
