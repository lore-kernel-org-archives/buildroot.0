From: Pierre <pinaraf@pinaraf.info>
Date: Wed, 28 Feb 2018 23:55:34 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant - Specify that old and
 new dbus are incompatible
In-Reply-To: <87fu5kkfy0.fsf@dell.be.48ers.dk>
References: <20180218215039.4811-1-pinaraf@pinaraf.info>
 <87fu5kkfy0.fsf@dell.be.48ers.dk>
Message-ID: <3603330.UGTkN10abk@peanuts2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, February 28, 2018 9:38:31 PM CET Peter Korsgaard wrote:
> >>>>> "Pierre" == Pierre Ducroquet <pinaraf@pinaraf.info> writes:
>  > Building wpa-supplicant with support for both DBus interfaces
>  > generates broken .service files.
> 
> In what way are they broken? I did a quick test build of 3
> configurations:
> 
> - Only old
> - Only new
> - Old and new
> 
> and I don't see any difference in the .service files?

It generated a .service file with an empty BusName in the [Service] part of 
the .service.
Since enabling only one interface generated the proper file, I deduced both 
could not be enabled together. Maybe something else in my configuration 
impacted that, I will check that again if you can't reproduce.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180228/fb2c328f/attachment.asc>
