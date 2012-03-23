From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Mar 2012 13:38:41 +0100
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
	: what about 1.8.x ?
In-Reply-To: <6cbdb6e08635a9c3e9b273a7a95a2a56@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
 <3A0E0C9320F449BC8EB3C0BC9A1CEF40@JohanW7>
 <6cbdb6e08635a9c3e9b273a7a95a2a56@zacarias.com.ar>
Message-ID: <36443DEF86594D9B9A729F56B7FA7973@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Gustavo 

I have built the 1.8 branch from debian i rebuild my app and it still works.
The 1.6.14 rease however breaks my app.

UpnpRegisterRootDevice,and UpnpRegisterRootDevice2 (using URL) both return UPNP_E_BAD_HTTPMSG.

The upnp httpparser seems to disagree on the http headers sent by httpd (busybox 1.19.4).
(parser_append returns PARSE_FAILURE.)
I did not test another http server.

So i stay with the debian release (1.8.x).

Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Gustavo Zacarias
Verzonden: vrijdag 23 maart 2012 0:37
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK : what about 1.8.x ?

On 2012-03-22 17:45, Sagaert Johan wrote:

> Hi Gustavo
>
> I wonder about this one : http://packages.debian.org/squeeze/libupnp4
> I have no clue what the difference would be between the 1.6.x from 
> sourceforge and the 1.8.x from debian.
>
> I have a tendency to think that the debian branch would be a more 
> stable one, but thats just a guess...
>
>
> 
> http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0
> ~svn20100507.orig.tar.gz
>
> Its the one included in the stable debian packages.
>
> Johan

Hi.
Me neither, but there's been a new libupnp release upstream just yesterday (1.6.16).
I'll give it a spin here to see how it behaves.
Regards.

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
