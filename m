Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73359606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=at1KWnvY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8A4406C3;
	Sat, 24 Oct 2026 19:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnggrQSWJsfW; Sat, 24 Oct 2026 19:40:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B3BA406CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792870800;
	b=fEngvtHEqnSRLaPQXqPqsgomt+zFuD7hMLoAVUa/lP+ZaLkN7FwWn2mycq+nW8ckFGLg
	 SPfJy7cANE+BQylnFd6QSE7XRdSTgpucLYS3Xd80eOWOU4zMMOb2gjsCGjCyWIIjBa7jN
	 Hyc0Wpk8u73xebrZDuvmxquGFmO1Na+J8I2GGyoRlqTpy4SSohH/+SyknNHv7bHGERsDH
	 v5hmslNOrC3ry6k3gZnqNjESlTEV/G4Dk3Rt7ybormC7OxOlttfsMMOKoB7Zlbj33rW2l
	 DbPZGhwG3QOENUXt7WWzorIKo3/jFtiCvixABulgjTXUCf3Pe6oX8Zuf41Vf5en3X2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792870800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=kTpZBPPoJkZ19uuFOtvQ0GuDM4d2NygjErRUPu5lrYM=;
	b=EtDNul4t8Q6+ksEd45qQ4+TATKP8yLoXQI8/Xadi7K0+HMTSBFWV/mvcQ+akFGldXjZP
	 JGJNpH17B61girtHvsMnvgYDCqfdJs3TK3vUshYd1Q/7oKu8LJyBeOtMsKBJflP0VrdzU
	 cWBcmAbGUaOYsQEboRhA6PrhoGvvjyZ0dhJVPX2xGR4x4HsnW4HjujMsj9Jd7DSygAYK6
	 z28X05meOaOE1UupIMGRmRQxHn+Ji1bu6eCRAJRuV9xi0bixEoGJ2h63qMBs5xSRhMcTk
	 Go5u3Dft2Ig3dAunFoQveIOFrjjQnu3namuaRcPHUf3A12EHODax1AssAkM734jqyxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792870800;
	bh=kTpZBPPoJkZ19uuFOtvQ0GuDM4d2NygjErRUPu5lrYM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=at1KWnvYcTreHRP8bY7KzpIEPpWACP2/VzmpbhMChQDzMIIzSV8BaRv+VaRXHvvQF
	 2tunCr8z7qmYyWck1VIwpxdEZxGYOBHL+BeA05eFG3Bn2POod7c1vMonsxSNyCptq2
	 5zzT+IpOD5/rThSGD+UiwtUJas7G5CHrjjDVPC6Bifp9Knb8turq+mksPJlF4aBfPZ
	 bo1Ffg64CrYPVoMds3fUZJ0cimwFP98JGi8HE/m5CQsB5wjDXWJ0R9qxbU6VRYhODp
	 Nvfc1ZdJcOd3t0129Fa6TBr8A2Ae+MHUuMPFf20L/tc8SDetyOAzWuaezE000tj8dv
	 oKFAHh8kgAOEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3BA406CF;
	Sat, 24 Oct 2026 19:40:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B7794D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 515E4406CF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhQHRGwfJYtV for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:39:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DC3D5406C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792870798;
 b=Aqvc3aXzlhB2tfzx19TudgzqVZUnwTKjDOhQCdvo/h+o8f62lfg5CcwO4HgU0srbzymX
 86aYAxUn8UrvrTQMXFPX/mNDoh7kX1R3ezN6DDNrSkTqwIGT0niO0H3Sjm9wnqPH3BNAN
 6KbNhUbo3rbRlhMS2L9B8eKR1B2KIKeSTwnQxSqBa25sRus8bPPuwQmdjoicjreATARPW
 Dm7mxtfoI24uX60mHrScY12dCw7TGYBGLcJxNlTAxpk//ypYV6Nc7Ibbyxpl6G6GZDndF
 zfZnjklSrKKVCToXJHnOzlWhbyHF89TAgjMRE3e4Ap8bJAu6LT4zFNvWgW9c0i2gBTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792870798;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=B+CztrExx0UG+no80L1wwOd/F9kGQT+JsCP3XYI4aD8=;
 b=bnzEgrR7ioCAa5SMy8f0wvPZJxji5fyC7yKP0qGh02K93evYIlTvBAs8sKhHCCXXSAWW
 xzTk+AkB4qaxK+lyu1zjF0LE7hg2YIXJjdqk5+xXMdbi9/P5mDv5qL2SgRWUki3buAAdR
 3vXxp2pydw8BN1moFQ64zGZ59PyhVxthsPwcAMEJvwFRhhOxt26LGBjRoTJF5s7QO5g0q
 82B8XH/BieaA82nvsyWv4qu86n3hXEjFjpAIwol7NxHFrzNfUajvQXJlisQRBLVuYsmWv
 SzHNecq8HFmUc5Z4/O5FO/qF7gOg5T6V5l3sAzOZYnWyCRT+merqsLynN3eSvx2qyXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MMUbjpwz; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC3D5406C3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:39:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7C1CB97A652; Sat, 24 Oct 2026 21:39:52 +0200 (CEST)
Message-ID: <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
Date: Sat, 24 Oct 2026 21:39:50 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
References: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
 <20261012183436.83398-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261012183436.83398-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  Hi all,

On 12/10/2026 20:34, Thomas Perale via buildroot wrote:
> Hi,
> 
> In reply of:
>> Hi Thomas!
>>
>> Am 12.10.26 um 17:41 schrieb Thomas Perale:
>>> I'm thinking again about potential solutions since the issue we brought
>>> upstream remained silent :-( [1]
>>
>> Yeah, I checked that too before sending this series. :-(
>>
>>> Do you have a slack account to give it another try there maybe ? (I don't have
>>> one sorry)
>>
>> No, I don't. I guess we could poke that discussion again?
>>
>>> I think the actual proper solution to this is the following. Given an external
>>> named "br-external" that has the package "foo" and a "buildroot" config that
>>> has the "busybox" package enabled:
>>>> ```json
>>> {
>>>     "bomFormat": "CycloneDX",
>>>     "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
>>>     "specVersion": "1.6",
>>>     "metadata": {
>>>       "component": {
>>>         "bom-ref": "project-name",
>>>         "type": "firmware",
>>>         "name": "project-name",
>>>         "version": "project-version",
>>>         "components: [
>>>          {
>>>            "bom-ref": "buildroot",
>>>            "name": "buildroot",
>>>            "version": "2026.08-891-ge17cfc9b3b",
>>>            "type": "firmware"
>>>          }, {
>>>            "bom-ref": "buildroot:br-external",
>>>            "name": "br-external",
>>>            "version": "...",
>>>            "type": "firmware"
>>>          }
>>>         ]
>>>       },

  This composition looks very elegant to me.

>>>     },
>>
>> Moving the Buildroot repository/version info from metadata.component to an element of metadata.component.components makes sense, if we want to leave metadata.component fields for people to provide info about whatever they are building using Buildroot. Then we'd need to provide some way to supply that info. But in any case I think that's independent of external tree info. :-)

  This is about the component name and version, right? I would say that this 
should be provided by command-line arguments to generate-cyclonedx. bom-ref 
would be derived from name by cleaning it up (replace everything non-alnum by dash).

>>
> 
> Yes we can discuss that part later. Because I have multiple option I need to
> lay down to think which one makes more sense.
> 
>>>     "components": [
>>>       {
>>>         "type": "library",
>>>         "bom-ref": "busybox",
>>>         "name": "busybox",
>>>         "version": "1.37.0",
>>>         ...
>>>       },
>>>       {
>>>         "type": "library",
>>>         "bom-ref": "br-external:foo",
>>>         "name": "foo",
>>>         "version": "...",
>>>         ...
>>>       },
>>>     ],
>>>     "dependencies": [
>>>       {
>>>         "ref": "buildroot",
>>>         "dependsOn": [
>>>           "busybox"
>>>           "buildroot:br-external",
>>>         ]
>>>       },
>>>       {
>>>         "ref": "buildroot:br-external",
>>>         "dependsOn": [
>>>           "br-external:foo"
>>>         ]
>>>       }

  This doesn't look good to me at all. AFAIU dependencies are supposed to be 
dependencies, not composition.

>>>     ]
>>> }
>>> ```
>>>> The metadata section declare the project and its core component (buildroot +
>>> externals), as its already the case with your patch. And then the dependencies
>>> express what are stored in which externals, as its already the case for buildroot.
>>>> I actually think that solution makes a lot of sense, even though it's not
>>> obvious by just looking at a component to understand where it comes from.
>>> But as we discussed previously nothing seems to fit that requirement in the
>>> component definition yet...
>>>> Again I wish I could give you a definite answer on how to handle this,
>>> what do you think about this solution ?
> 
>> I think dependencies are the wrong approach. I guess you can see an external
>> tree as a dependency of the overall build, but recording packages provided by
>> an external tree as its dependencies doesn't make sense: the external tree
>> *provides* the packages, it does not require them. It's about origin of
>> components (packages), not dependency between components. If I define a new
>> package in my external tree and it later gets merged into Buildroot package
>> dependencies don't change, only the origin of that package.
> 
> I understand your point but the same logic apply for the 'buildroot' meta-component
> it also provides a number of packages but in the current implementation all packages
> Buildroot provides are registered as dependencies.
> How I understand it is: "to have a full buildroot build the entire list of packages
> listed as dependency is first required".
> 
> I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
> of your project. To have it work properly with all the packages available under it
> you need to add this dependsOn to all the packages similarly to what I described in
> my previous email:
> 
> https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png
> 
> I think this is the kind of view we would want to achieve to show the hierarchy
> of the project with externals ?

  Not really I think - that graph should show dependencies, like our 
graph-depends, no?


>> I'm also wary of encoding that origin information in bom-ref, as your
>> proposal does for packages. Bom-ref is supposed to be an opaque identifier.
>> Nothing against making it human-readable instead of a UUID or other random
>> string, but we should not use it to encode information that should be
>> machine-readable.
> 
> Yes here I just used as a way to improve the readability but I don't think
> using an uuid changes the logic of the proposal.

  I don't see the encoding of the external in the bom-ref as carrying 
machine-readable information either. I think the idea is that the dependencies 
carry the machine-readable information. But then, they don't, because different 
kind of dependencies are mixed (actual dependencies and composition).

  I don't have a solution unfortunately...

  Regards,
  Arnout

>> Where we're in agreement is that CycloneDX doesn't really have any suitable
>> fields. That is why I used a property (where we can define our own), and
>> suggested in my cover letter to register a CycloneDX namespace for Buildroot
>> (which implies publishing property definitions). It's not as nice as an
>> upstream field for "package repository" or similar, but that doesn't exist,
>> and with a registered namespace it'd be well-defined, documented, and
>> findable from CycloneDX documentation (and it'd let us clean up the current
>> BR_TYPE).
>>
>> Best regards,
>> Fiona
> 
> Best regards,
> Perale Thomas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
