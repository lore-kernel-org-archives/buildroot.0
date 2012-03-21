From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 11:26:24 -0300
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
In-Reply-To: <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
Message-ID: <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

According to the API docs, UpnpSetWebServerRootDir is only for the 
internal web server:

"UpnpSetWebServerRootDir sets the document root directory for the 
internal web server. This
directory is considered the root directory (i.e. ?/?) of the web 
server."

So i think you're doing something odd there....
Is it really failing you on UpnpInit? I've just made a tiny test case 
with a powerpc target uclibc 0.9.33 nptl that works just fine up to 
that.
Regards.
