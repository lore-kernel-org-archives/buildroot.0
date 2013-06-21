From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Jun 2013 12:48:13 +0200
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E401E5@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
 <51C421AF.20904@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E401E5@NB-EX-MBX01.diasemi.com>
Message-ID: <51C42F6D.7080701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/13 12:31, Thomas Weininger wrote:
>>> > >
>>> > >So it uses Python distutils (the setup.py) in order to build smbus.so. And it
>> >seems to me that it uses the host distutils instead of the target system's
>> >one.
>>> > >If this is the problem, then the Module.mk or the setup.py will most likely
>> >need to be patched in order to use the target system toolchain?
>> >
>> >   Hang on, maybe you have to build host-python-setuptools first?
> [Thomas Weininger]
> I can't find a python-setuptools option in the host utilities menu in Buildroot's make menuconfig. How can I build it?
> However, for the target BR2_PACKAGE_PYTHON_SETUPTOOLS is set.

  It's not a user-selectable host package, since it is only needed to 
build other packages.  Normally, you build it by adding it to the 
I2C_TOOLS_DEPENDENCIES variable. But you can also do it directly from the 
command line:

make host-python-setuptools
make i2c-tools-dirclean # Just to be sure
make


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
