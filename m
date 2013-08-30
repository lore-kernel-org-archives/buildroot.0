From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Aug 2013 10:22:26 +0200
Subject: [Buildroot] feature or pebkac
In-Reply-To: <20130830095831.12c3c743@skate>
References: <20130829111708.c603e5bf976541d3abd3a43a@lavabit.com>
 <521F9B91.7040903@mind.be> <20130830095831.12c3c743@skate>
Message-ID: <52205642.90408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/13 09:58, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 29 Aug 2013 21:05:53 +0200, Arnout Vandecappelle wrote:
>> On 08/29/13 20:17, rh wrote:
[snip]
>>> But I don't need all that and I now use --single-branch argument
>>> to git clone followed by git archive to create a tar ball.
>>
>>    That's a great idea! However, this option is only available since git
>> 1.7.10 and I think that many production environments still have older git
>> versions.
>
> Can't we do like what we do for shallow clones? Try if --single-branch
> is supported and works, and if so, all right, if not, fall back to the
> normal way?

  Not so easily. For shallow clone, we check up front with ls-remote if 
it will be possible.  For --single-branch we would have to check the git 
version. And the download commands already are too complex...

  I'm really thinking we should move all that to a proper shell script. 
Then adding that kind of magic would feel as much less of an overhead.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
