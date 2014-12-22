From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Dec 2014 08:35:01 -0300
Subject: [Buildroot] [PATCH] strongswan: bump to version 5.2.1
In-Reply-To: <20141220214814.2f2f0521@free-electrons.com>
References: <1418691367-12528-1-git-send-email-gustavo@zacarias.com.ar>
 <20141220214814.2f2f0521@free-electrons.com>
Message-ID: <549801E5.7020104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/2014 05:48 PM, Thomas Petazzoni wrote:
>> -config BR2_PACKAGE_STRONGSWAN_TOOLS
>> -	bool "Enable additional utilities (openac, scepclient and pki)"
> 
> You're removing this option. Shouldn't it be added to Config.in.legacy,
> for proper legacy handling?

Hi.
Possibly, however it won't do any good since some tools (openac) are
just gone upstream and i've defaulted to 'y' for the new split tool options.
Frankly speaking i'd rather see the number of options reduced for this
package, only a few of them introduce dependencies:
Curl fetcher (libcurl)
TNCCS 1.1 (libxml2)
EAP-SIM (pcsc-lite)

And that's it, the other options won't make strongswan that big.
Regards.
