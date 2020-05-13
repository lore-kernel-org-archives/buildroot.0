From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 May 2020 22:16:28 +0200
Subject: [Buildroot] Adding post image hook
In-Reply-To: <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
Message-ID: <20200513221628.42c07184@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis-Paul,

You should consider changing your e-mail client, or configure it
better. Indeed, the plain text version of your e-mail is not properly
quoted, i.e the text from me you are replying to was not quoted with
">" signs.

On Wed, 13 May 2020 22:05:08 +0200 (CEST)
lpdev at cordier.org wrote:

> You can actually do that, by running:
> 
> make VARS=<some-variable-name> printvars
> 
> from your post-image script.
> 
> If what you need to retrieve is the version of the different packages,
> you can also run:
> 
> make show-info
> 
> from your post-image script, and parse the JSON output.
> 
> 
> 

> Thank you for the tip. However this method seems to be very slow
> because of the makefile parsing (takes between 5 to 10sec on my PC).
> I would not recommend that for retrieving values of a lot of
> variables.

You can do:

  make VARS=FOO% printvars

if the different variables you want to get match a wildcard.

Or alternatively, you can do just:

  make printvars

pay the one-time price of dumping all variables, and then grab what you
need from the output.

But otherwise, I agree that indeed it is quite slow.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
