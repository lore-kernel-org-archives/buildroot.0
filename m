From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 22 Mar 2012 21:45:36 +0100
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
	: what about 1.8.x ?
In-Reply-To: <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
Message-ID: <3A0E0C9320F449BC8EB3C0BC9A1CEF40@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Gustavo

I wonder about this one : http://packages.debian.org/squeeze/libupnp4
I have no clue what the difference would be between the 1.6.x from sourceforge and the 1.8.x from debian.

I have a tendency to think that the debian branch would be a more stable one, but thats just a guess...


http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0~svn20100507.orig.tar.gz

Its the one included in the stable debian packages.

Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Gustavo Zacarias
Verzonden: woensdag 21 maart 2012 15:26
Aan: Sagaert Johan
CC: buildroot at busybox.net; 'Peter Korsgaard'
Onderwerp: Re: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK

On 2012-03-21 10:32, Sagaert Johan wrote:

> 	/*******************************************
> 	* Next, set your root web server directory.
> 	********************************************/
> 	ret = UpnpSetWebServerRootDir(WEB_ROOT_DIR);
> 	if(ret != UPNP_E_SUCCESS)
> 	{
> 		printf("upnp_init: UpnpSetWebServerRootDir failed with code: %d\n", 
> ret);
> 		return ret;
> 	}
>
> 	SNIP .....

According to the API docs, UpnpSetWebServerRootDir is only for the internal web server:

"UpnpSetWebServerRootDir sets the document root directory for the internal web server. This directory is considered the root
directory (i.e. "/") of the web server."

So i think you're doing something odd there....
Is it really failing you on UpnpInit? I've just made a tiny test case with a powerpc target uclibc 0.9.33 nptl that works just fine
up to that.
Regards.


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
