From: James J. Dines <jdines@jdines.net>
Date: Sat, 04 Sep 2010 23:12:01 -0400
Subject: [Buildroot] About Git through SSH
In-Reply-To: <4C8308DE.2060307@jdines.net>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org><201009030730.57559.minimod@morethan.org><20100903150459.059d682a@surf><201009030937.31967.minimod@morethan.org><20100903170323.3b5a8e6f@surf><000c01cb4bd0$088c14f0$19a43ed0$@pauljones.id.au>	<20100904185831.78af11ca@surf>	<001201cb4c9c$bc402280$34c06780$@pauljones.id.au>
	<4C8308DE.2060307@jdines.net>
Message-ID: <4C830A81.3010606@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/04/2010 11:05 PM, James J. Dines wrote:
<snip>
> 
> I believe git should clone into the DL_DIR once, and only once (unless
> of course you delete it from DL_DIR.)  I say this because it is source
> regardless of the particular tool used to keep track of it.  Then, just
> soft link to it's location in the DL_DIR from the build dir. (see also
> below)
> 
Sorry for the reply to my own post. I forgot to mention that if
buildroot does softlink to the git repository the clean needs to be
careful not to delete it.  If that is too much trouble then a cp of the
tree in its current state to build dir could be done.  In order to avoid
copying the whole repository and wasting space the .git dir in the
cloned tree should not be copied of course :-)

Anyway, I'm just brainstorming here.  Hopefully it helps, but apologies
if not!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMgwp/AAoJECSpOhdQESq6oIYH/iB/V6BvG0zf3P5vW5KHP1u1
MhX1rf5KvT3c5IoVEZxjaAfZo46mDHtmmrxCO2zwufYXhpCXZLeCNuhRfrpBRmqf
my1RC0kj5voSVj9le99UXty8/epCN30T8s4engBlu837mYZb+BkcqkTBUpgoSaJk
dHs3jM0hq9JmIanKgAFK4WBzawLmHPxRhtBz8amUsqotgRNLslF12Sda9cdPrXgE
mLWEX3+lEbVATSu1MpH0I3+KzQVy0ZsGg1Q7hPH590+T56Gjxy6e8vr+u6AAKlTQ
eDjLcsgMupqCZEQ3VZ2/9338o0rAUOWKz0t79jZ3Z3tHZps56RE7anjOe2CvObc=
=ZpuI
-----END PGP SIGNATURE-----
