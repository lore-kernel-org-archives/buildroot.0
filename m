From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 07:56:13 +0200
Subject: [Buildroot] Sample configurations / test suite ?
In-Reply-To: <20130701091925.6c67a6c7@skate>
References: <20130627004309.6f15cf53@skate> <51D11AE2.5050707@mind.be>
 <20130701091925.6c67a6c7@skate>
Message-ID: <51D26B7D.4020801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 09:19, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 01 Jul 2013 08:00:02 +0200, Arnout Vandecappelle wrote:
>
>>> What do you think about this? Do you have ideas on how to implement
>>> this? Should it be part of the Buildroot tree itself, or something
>>> separate? If something separate, how do we keep Buildroot and this
>>> separate tree in sync?
>>
>>    For both use cases, it makes the most sense if these defconfigs are
>> part of the buildroot tree.
>
> In order to keep those configurations consistent with the rest of
> Buildroot, I agree that having them in the Buildroot tree is probably
> the easiest option. However, I'm worried about the size of it: I was
> not only thinking of defconfigs, but potentially additional artifacts
> needed to make the build work.

  I don't see that becoming an issue, honestly.

  When it does, we can still split it up I guess.


>>    The risk is that the configs/ directory becomes too large and unwieldy
>> (people will have to browse it to find the defconfig they want). So
>> perhaps this calls for changing it into a tree.
>>
>>    Personally, I think it makes sense to move the defconfigs into the
>> board/ directory. Many defconfigs already refer into there for kernel
>> configs or specific patches, so it makes sense to put the defconfig in
>> the same place.
>
> Funnily enough, the defconfigs *used* to be in the board/ directory
> (which at the time was target/device). We had a discussion back in the
> days on whether the defconfigs should remain with their board, or
> grouped in the top-level configs/ directory.
>
> See
> http://lists.busybox.net/pipermail/buildroot/2009-October/029556.html
> and my complaint
> http://lists.busybox.net/pipermail/buildroot/2009-October/029559.html.
>
> That said, after several years, I feel that configs/ was a pretty good
> choice, I don't really feel the need of moving things back to board/,
> especially considering the change it will cause to all users.

  Can't argue with the wisdom of years :-)


> Moreover, I am not sure that those test suite / demos
> configurations should be located in the same place as the minimal
> defconfigs we have in configs/.

  Good point. But then, that goes against the "putting all configs 
together" philosophy.

>
>>    And while I'm on this subject, I think the structure of the board
>> directory is not very clear. It would make sense to me to switch to the
>> layout that U-Boot uses: board/<arch>/<soc>/<boardname>/ (although the
>> <soc> level may be optional for us). You can expect people to know what
>> the basic architecture of the processor is, but not always who the vendor
>> is (which is probably why raspberrypi, beaglebone and gnublin don't have
>> a vendor directory). Or sometimes there are multiple vendors for the same
>> board (e.g. Beagleboard and SabreLite).
>
> Hmm, no strong opinion on this one. How many end users know which SoC
> the RasberryPi is using?

  And how many people know who is the vendor of the RPi? :-)


  Regards,
  Arnout

>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
