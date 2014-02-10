From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 08:05:29 +0100
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <CAEqQue2LWkRXk6xDW=znSzenJ41kGeRNc_uGj0bOM0ChhkEKeQ@mail.gmail.com>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>	<20140130200821.2c0559d8@skate>	<CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>	<20140131090444.725c88d4@skate>	<CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>	<52F0ADF4.8080509@mind.be>
 <CAEqQue2LWkRXk6xDW=znSzenJ41kGeRNc_uGj0bOM0ChhkEKeQ@mail.gmail.com>
Message-ID: <52F87A39.5020209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/08/14 14:19, servo gmrt wrote:
> Dear Arnout,
> 
>      Herewith I am attaching the changes I made in the buildroot, to
> compile the rtai-4.0.
> 
>     I took the 02-08-2014 daily snapshot from buildroot download repository.
> 
>     I used the following command to generate the patch,
> 
>       "diff -uprN working-dir original-source-dir"
> 
>     Is above command sufficient or do I need to add any flags along with
> diff command.


 So you just bumped the version number to 4.0. Clearly, that is not enough.

 As Thomas mentioned in his first reply: it's a problem with missing
quotes around $(CC) in one of the scripts used by rtai - most likely the
configure script itself. You can try to fix it there. Or you can disable
ccache (and do a 'make rtai-dirclean'), which will probably get you further.

 There is a reasonable chance, however, that you'll encounter other
problems along the way.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
