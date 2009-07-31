From: Courousse, Damien <damien.courousse@logica.com>
Date: Fri, 31 Jul 2009 17:57:17 +0200
Subject: [Buildroot] linux .config : override: reassigning tosymbolAEABI
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com><20090729132515.GM19257@buzzloop.caiaq.de><F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com><20090729134234.GY13236@buzzloop.caiaq.de><F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com><20090729142610.GB9464@buzzloop.caiaq.de><F81DF98CADE6064F81A746D7C8323593782CC1@fr-ex009.groupinfra.com>
	<20090731122026.1c5d4b86@surf>
Message-ID: <F81DF98CADE6064F81A746D7C8323593782D4A@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Message d'origine-----
> De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> De la part de Thomas Petazzoni
> Envoy??: vendredi 31 juillet 2009 12:20
> ??: buildroot at busybox.net
> Objet?: Re: [Buildroot] linux .config : override: reassigning
> tosymbolAEABI
> 
> Hello Damien,
> 
> Le Wed, 29 Jul 2009 18:07:33 +0200,
> "Courousse, Damien" <damien.courousse@logica.com> a ?crit :
> 
> > root=/dev/nfs rw
> > nfsroot=10.84.34.52:/mnt/fractal/buildroot/buildroot-
> 2009.05/project_build_arm/logica_demo/root
> >
> ip=10.84.34.8:10.84.34.52:10.84.34.1:255.255.255.192:debian_test:eth0:off
> 
> The /mnt/fractal/buildroot/buildroot-
> 2009.05/project_build_arm/logica_demo/root
> directory cannot be used to boot over NFS, because the /dev directory
> doesn't contain any device file (Buildroot can create them, since it
> requires root priviledges).
> 
> To boot over NFS, you have to do the following things:
> 
>  * Enable the generation of a tarball in the Buildroot configuration /
>    Target filesystem options
> 
>  * Uncompress the tarball somewhere in your host, while being root (or
>    using sudo), so that tar is allowed to create device files
> 
>  * Mount the location where you uncompressed the tarball over NFS
> 
> Sincerly,
> 
> Thomas
> --
[Damien Courouss?] 

Hello Thomas!

I completely forgot to look at the side of the /dev files!
You spotted the right problem, thanks! Everything is OK now.

Thanks again to all of you for your help.

Kind regards,
Damien

Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.
