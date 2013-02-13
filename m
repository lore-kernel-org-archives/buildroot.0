From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Feb 2013 23:42:42 +0100
Subject: [Buildroot] disable downloaded source cache
In-Reply-To: <CAKAx1cjcxkBq67w_DV7sFK_Z+7X9+WkMuEkVWiswWgsq-Eskig@mail.gmail.com>
References: <CAKAx1cjcxkBq67w_DV7sFK_Z+7X9+WkMuEkVWiswWgsq-Eskig@mail.gmail.com>
Message-ID: <511C16E2.4010105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 17:14, Lionel Orry wrote:
> I am experimenting with the BR2_ROOTFS_OVERLAY feature which works
> great for me to add my overlay before image creation.
>
> My overlay is versioned with git, and I would like however to allow
> automatic synchronisation (pull or even clone, the repository is very
> small) with my remote each time I simply do 'make'. The overlay
> feature only copies a folder content, but does not allow updating the
> source folder content from a site (I perfectly understand it is not
> its purpose and the feature must be kept simple).

  Like so often, my answer to this kind of thing is: wrap the call to 
buildroot in a script. I.e., write a script that updates the overlay (and 
any other custom package), regenerates the config from a defconfig, does 
whatever other required magic, then calls make, and maybe does some 
post-processing on the resulting images as well.

  This makes it much easier to understand what happens than a totally 
hacked together xxx-overlay package.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
