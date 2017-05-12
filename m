From: Linux User <newhorizons009@gmail.com>
Date: Fri, 12 May 2017 09:51:57 -0400
Subject: [Buildroot] Problems building iotop
In-Reply-To: <20170511174933.28030e0a@free-electrons.com>
References: <CA+12NB+dzKMw2x=mBESq+Ti0COMiQmbHTiRaO=E35xOZch+4gw@mail.gmail.com>
 <20170511174933.28030e0a@free-electrons.com>
Message-ID: <CA+12NBKcGynVqiynZvETmSQEdLr138tM9s8n32RpwDgE1w7ABg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Posting again, with the maillist in cc.

I am using 2013 version of BR.

Oh my buildroot is already setup. I am build everything else just fine but
iotop.

I brought ftop from latest BR to my BR, added to the package dir, update
the Config.in and life is good. Life is not so good when I do the same with
iotop. I cant figure why.

Below is the example of ftop working just fine. But iotop wont.

 make ftop-dirclean
rm -Rf /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0
@amuscorbld:~/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src$
make ftop-rebuild
rm -f /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0/.stamp_built
rm -f /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0/.stamp_staging_installed
rm -f /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0/.stamp_target_installed
rm -f /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0/.stamp_images_installed
rm -f /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/
som/src/output/build/ftop-1.0/.stamp_host_installed
>>> ftop 1.0 Extracting
gzip -d -c /home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/dl/ftop-1.0.tar.gz
| tar --strip-components=1 -C /home//PNC_Projects/TR3000/
Firmware/Analog_IM/platforms/som/src/output/build/ftop-1.0  -xf -
>>> ftop 1.0 Patching package//ftop

Applying 0001-overflow.patch using patch:
patching file src/ftop.c
>>> ftop 1.0 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home//PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/ftop-1.0
-name $file); do cp support/gnuconfig/$file $i; done; done

On Thu, May 11, 2017 at 11:49 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 11 May 2017 11:45:59 -0400, Linux User wrote:
>
> > I am getting,
> >
> > make iotop
> > make: *** No rule to make target `iotop'.  Stop.
>
> Most likely you haven't created a Buildroot configuration.
>
> Have you run "make menuconfig", define the Linux system you want to
> build, and then run "make" ?
>
> If not, then please read some documentation about Buildroot :-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170512/d4287852/attachment.html>
