From: Patrick Doyle <wpdster@gmail.com>
Date: Mon, 1 Jan 2018 09:42:32 -0500
Subject: [Buildroot] Sharing an SDK with others
Message-ID: <CAF_dkJDKzOUDW=68rp1ZUtuD2NbTvSYt6dFHxoJZx7_wAGf4QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!
Happy New Year!

I work with a team of developers, most of whom care much more about
developing the end application than they do about the ins & outs of
configuring a kernel, building a rootfs, etc...  (I guess it takes all
kinds).

I would like to distribute a (buildroot based/compatible) SDK to the
other developers to use so that they may compile their code and scp it
to the target for testing/debugging.  I was very excited to see a
"make sdk" option available.  I was hoping that would produce a
relocatable SDK tarball of some sort in the images directory.  But
that does not seem to be the case.  (In fact, when I ran "make sdk" on
a fresh checkout, the system still generated bootstrap code, a rootfs,
and a kernel, as well as the host toolchain... so I'm not sure what
"make sdk" actually does.)

I tried plan B:

Set BR2_HOST_DIR=/opt/<company-name>/<project-name>
Give myself write permission to /opt
make

When all was said & done, I followed instructions from
http://www.king-foo.com/2011/11/creating-debianubuntu-deb-packages/
and https://debian-administration.org/article/529/Making_Debian_packages_from_proprietary_software
to construct a .deb file to distribute my /opt base code chain.

Then I blew away the contents of /opt/<company-name>, installed my
.deb file, and tried a fresh build (pointing BR2_HOST_DIR to /opt
again), but when I tried to build, the build failed because
/opt/<company-name>/<project-name>/lib64 was not writable.

So I tried plan B-2:
I configured buildroot to use an external, user supplied, toolchain in
/opt/<company-name>/<project-name> and made the various compiler setup
options match those of the installed toolchain (hopefully).

Thanks for reading this far :-)
Here is my (set of) question(s):
Is this a reasonable approach?
Is there a better approach?
Would anybody like me to submit a documentation patch outlining the
best approach (or, at a minimum, _an_ approach)?
(I can guess I know the answer to that last one).

Happy New Year All.

And Thanks.

--wpd
