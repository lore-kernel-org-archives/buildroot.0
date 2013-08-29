From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 21:05:53 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
Message-ID: <521F9B91.7040903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 20:17, rh wrote:
> I have found that changing the url for a custom kernel tar ball does not
> trigger a rebuild when running make.  I have removed linux-custom dir
> and then make fetches the new tar ball and rebuilds.

  That's right. Buildroot doesn't try to be perfect for rebuilds when the 
configuration changes - but if it is simple to fix, patches are welcome!


> I have found that when I specify a kernel git repo that I get the whole
> repo.

  If you specify a tag, then it should do a shallow clone.


> But I don't need all that and I now use --single-branch argument
> to git clone followed by git archive to create a tar ball.

  That's a great idea! However, this option is only available since git 
1.7.10 and I think that many production environments still have older git 
versions.

> I do this for repos
> that have no snapshot or tar ball. I thought that this feature might exist
> but I couldn't find it.  Maybe I can edit some config manually?

  There's no config for that, it's part of the core infrastructure.


  Regards,
  Arnout

>
> Would it be a useful feature for others if it's not there now?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
