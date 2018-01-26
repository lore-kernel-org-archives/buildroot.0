From: Marc Murphy <marcmltd@marcm.co.uk>
Date: Fri, 26 Jan 2018 15:52:23 +0000
Subject: [Buildroot] post image blues (fakeroot and chown)
Message-ID: <8AE4BE7D9622DF41B76E1AD887AA1A47A52ED7C0@MARCM-SBS2011.marcmltd.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

I am in the final stages of getting the buildroot image output configured and having an issue.

I have a couple of folders that I am using as partitions on the target. The images are created using genimage in the post-image.sh script before being included in the final complete image. But I have an issue with the folder permissions and trying to correct them before the image is built.

On a normal linux system I would of course perform a:
# sudo chown -R 0:0 some_folder

That would put the permissions in to the correct root user and group.

This can't be done in the post-image script as cannot use sudo as it requires intervention of entering password.

I have then been trying to use fakeroot and it simply refuses to persistently change the owner and group, ll will show creator when not logged in as fakeroot but root when logged in as fakeroot.

Is there any "standard" way to do this ?

I have been trying with all kinds of ways even resorted to trying to use fakeroot and makedevs:
fakeroot /home/Devel/buildroot-2017.02/output/host/usr/bin/makedevs -d $PWD/permissions $PWD/image_staging/


Kind Regards

Marc
