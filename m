From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 18 Apr 2018 04:52:15 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-17
In-Reply-To: <20180418060044.E69E820D99@mail.bootlin.com>
References: <20180418060044.E69E820D99@mail.bootlin.com>
Message-ID: <CANxTyt6m03+PsZa6245eLU2gpj=B0BP_3ojprtR13OwAyDS2=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Dushara,

On Wed, Apr 18, 2018 at 2:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-04-17, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>          sh4 |               luaexpat-1.3.0-1 | http://autobuild.buildroot.net/results/b126bce0bbd111f021ed5be7c8773fef2a8f8579
>
> --
> http://autobuild.buildroot.net

This bug was reported as a luaexpat build error, but the fault is
really due to prosody.  When the autobuilder's defconfig is applied,
the following is emitted:

warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASEC which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAEXPAT which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAFILESYSTEM which
has unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASOCKET which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASEC which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAEXPAT which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAFILESYSTEM which
has unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASOCKET which has
unmet direct dependencies (!BR2_STATIC_LIBS &&
BR2_PACKAGE_HAS_LUAINTERPRETER)

I will send in a patch to make prosody depend on !BR2_STATIC_LIBS shortly.

Regards,
Danomi -
