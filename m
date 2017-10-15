From: Dushara Jayasinghe <nidujay@gmail.com>
Date: Mon, 16 Oct 2017 06:53:04 +1100
Subject: [Buildroot] [PATCH] prosody: bump to version 0.10.0
In-Reply-To: <20171014133956.25082-1-francois.perrad@gadz.org>
References: <20171014133956.25082-1-francois.perrad@gadz.org>
Message-ID: <20171015195304.GA10161@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

I'm listed as the maintainer for Prosody simply by virtue of the
fact that I first added the Prosody package. I'm not a Prosody
dev, so these are more questions than comments...

>  	-- Not essential, but recommended
> +		"carbons"; -- Keep multiple clients in sync
> +		"pep"; -- Enables users to publish their mood, activity, playing music and more
>  		"private"; -- Private XML storage (for room bookmarks, etc.)
> +		"blocklist"; -- Allow users to block communications with other users
>  		"vcard"; -- Allow users to set vCards
I had a brief look at the release notes, and they state that the new modules that you added
are 'native', does that mean that the required libraries are automatically included in the
install?

>  	-- Other specific functionality
> -		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
Did you mean to comment this out?

> --- These are the SSL/TLS-related settings. If you don't want
> --- to use SSL/TLS, you may comment or remove this
> -ssl = {
> -	key = "certs/localhost.key";
> -	certificate = "certs/localhost.crt";
> -}
Does Prosody start without any certificates? The config I provided was just enough to allow
Prosody to start and accessible (albeit the user needs to make adjustments to suite that site).

> -authentication = "internal_plain"
> +authentication = "internal_hashed"
That's a good idea.

>  log = {
> -	-- info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
> -	-- error = "prosody.err";
> -	"*syslog"; -- Logging to syslog
> +	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
> +	error = "prosody.err";
Where are these files created? In root I believe. My preferance is to just use syslog. I think
the posix module needs to be enabled for syslog to work though.

> -pidfile = "/var/run/prosody/prosody.pid"
Is this intentional? I used the pidfile to allow the startup script to terminate the service.
Can you still terminate the service without this?

As I said earlier, I'm not a Prosody dev, so your changes may be perfectly valid. If so,
explaining those changes in the commit message would be useful. I've CCd the dev mailing list
in case they have additional comments.

Thanks,

Dushara
