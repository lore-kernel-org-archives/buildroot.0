From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 20:41:59 -0300
Subject: [Buildroot] [PATCH 1/2] libtorrent: new package
In-Reply-To: <4FADA2BA.3010507@mind.be>
References: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
 <4FADA2BA.3010507@mind.be>
Message-ID: <d72c000db80dab016beb8feec3f3a870@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-11 20:37, Arnout Vandecappelle wrote:

> On 05/11/12 21:39, Gustavo Zacarias wrote:
>> +LIBTORRENT_DEPENDENCIES = host-pkg-config libsigc openssl
>> +LIBTORRENT_CONF_OPT = --enable-aligned --enable-openssl
>
>  Isn't the openssl dependency optional?
>
>  Regards,
>  Arnout

Yes for libtorrent, no if you want rtorrent to work (needs libtorrent 
built with openssl to work - it builds without it but will bail out when 
running it).
I can add an openssl Config.in knob but since 99% of the time 
libtorrent will be used as a dependency of rtorrent it's kind of 
pointless.
Regards.
