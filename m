From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 27 Aug 2012 09:07:48 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <3C32AECB8207924A9A228348325DB2D2905100@mntserv.meier-nt.local>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local><3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local><20120824135323.654eb15b@skate><CAAfyv37CS+Hss_-kfiv9tGZDTPpeiG-bzjyF5mqNdL61=PNupg@mail.gmail.com>
 <910D354268014B298DD6633E97BC1DEE@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D2905100@mntserv.meier-nt.local>
Message-ID: <503B1CC4.2070102@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.08.2012 08:37, schrieb Dirk Lohse:
> I would prefer to set root-password "root" as default - so that dropbear works.
I would also opt for a default password.
> But would this bring up questions like "what is the default password"?
This could be mentioned in the "Welcome"-message.

Kind regards

Stephan
> Dirk
>
> -----Urspr?ngliche Nachricht-----
> Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
> Gesendet: Freitag, 24. August 2012 19:46
> An: Belisko Marek
> Cc: Dirk Lohse; buildroot at uclibc.org; buildroot at busybox.net
> Betreff: Re: [Buildroot] dropbear permission denied
>
> Le Fri, 24 Aug 2012 16:31:38 +0200,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>>> Correct. dropbear doesn't allow login into accounts that have an
>>> empty password.
>> Is there any way in e.g. post-processing to set some passwd (maybe
>> empty) for root user to avoid such troubles? Anybody using it that
>> way?
> See http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf
> slide 25. You can use the post-build script mechanism to tune
> the /etc/passwd file to set a root password.
>
> I once thought of adding a Kconfig option for that, but it would mean
> that the root password would be stored as clear text in the .config
> file, which probably isn't that nice.
>
> Should we make the default 'root' password be 'root' so that it is
> non-empty and it works with Dropbear? Or simply add a FAQ entry
> which explains this problem? Other ideas?
>
> Best regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
