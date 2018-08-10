From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 10 Aug 2018 13:11:04 -0400
Subject: [Buildroot] buildroot, python{,3}, and pip
Message-ID: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does anybody have experience using pip on a buildroot generated system?

Poking around, I have found patches to add a python-pip module, (for
example http://lists.busybox.net/pipermail/buildroot/2013-July/075194.html)
but I don't see that in my 2018.02 release.

I have a severely memory constrained system and have already found that

# python3 -mensure-pip

...will add a "pip" command to my rootfs once I have booted up... but
sometimes that command fails (apparently depending on the amount of
free RAM I have, as a first pass diagnosis) and "pip install
<some_package>" works sometimes, and fails other times, again
apparently package size/free RAM relatedly.

So, I might have other system issues to deal with, but in the mean
time, I thought I would ask why pip isn't available as an option to
begin with.

Yes... I get the whole philosophy of "buildroot doesn't support
package managers".  Is that the primary reason it isn't supported?  Or
am I setting myself up for failure should I go down the rathole of
adding support myself?

--wpd
