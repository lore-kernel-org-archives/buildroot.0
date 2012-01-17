From: Stephan Raue <mailinglists@openelec.tv>
Date: Tue, 17 Jan 2012 23:32:26 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <201201161845.51186.arnout@mind.be> <8739bfcusn.fsf@macbook.be.48ers.dk>
 <201201171457.13088.arnout@mind.be> <87ty3upg82.fsf@macbook.be.48ers.dk>
 <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
Message-ID: <4F15F6FA.5020805@openelec.tv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/2012 11:13 PM, Yegor Yefremov wrote:
> I added this package, because it is udev's dependency now. I'll have 
> to look into udev, to tell if it uses only library or binary too. As 
> we came to this topic, what is your opinion on adding /run? It also 
> became udev's dependency. I'll set my udev's patch series tomorrow. 
> Yegor _______________________________________________ buildroot 
> mailing list buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot 

udev byself needs only the lib. the binarys can be used as 
insmod/rmmod/modprobe/modinfo replacement from module-init-tools or 
busybox's solution. the "kmod" binary byself is a multicall binary so 
insmod/rmmod/... can be symlinks to this binary.

Stephan
