From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Oct 2019 10:44:50 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: enable PIC/PIE,
 RELRO and SSP by default
In-Reply-To: <87o8y4gfwu.fsf@dell.be.48ers.dk>
References: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
 <20191025220446.7e21071d@windsurf.dhcp.lyon.intranet>
 <87o8y4gfwu.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80FGRqQw-hAnAV_DokfjpeUyrwDtBoS3eftspxcBWEFyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le sam. 26 oct. 2019 ? 09:41, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Fri, 25 Oct 2019 21:54:56 +0200
>  > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
>  >> Enhance security by enabling PIC/PIE, RELRO and SSP by default.
>  >>
>  >> This could help making IoT more secure and fight againt the assumption
>  >> that buildroot does not support binary hardening (see
>  >> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)
>  >>
>  >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>  > I'm not sure we're ready to do that. A first step would be to add some
>  > randomization in the autobuilders to test those features (by improving
>  > ./utils/genrandconfig). This will allow us to test that enabling those
>  > features doesn't break too many packages. Then we can discuss at
>  > enabling it by default, even though I find that it kind of breaks the
>  > logic that Buildroot does something minimal/basic by default.
>
> I agree that it makes sense to do some more testing first, but as a data
> point, I do enable SSP_REGULAR / RELRO_PARTIAL / FORTIFY_SOURCE_1
> without issues on the project I'm currently working on.
>
> And yes, Buildroot normally does the most minimal thing out of the box,
> but defaults also matter when we talk about these "complicated" security
> related things.
>
> We have done similar things in the past, E.G. the change of password
> encoding algorithm:
>
> commit 9cf2280846b60ba081ed21339b407e2c761b599d
> Author: Matt Weber <matthew.weber@rockwellcollins.com>
> Date:   Wed Dec 5 20:06:28 2018 -0600
>
>     system cfg: set mkpasswd default to SHA256
>
>     This patch changes the default mkpasswd method to SHA256 from MD5.
>     The change both improves the quality of the hash used and prepares
>     for eventually removing MD5 as a option.
>
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>     Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> But lets not rush things.
OK, I'll take care of sending patches to update utils/genrandconfig
and fix the autobuilder failiures. Hopefully, we could then enable
these options by default.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
