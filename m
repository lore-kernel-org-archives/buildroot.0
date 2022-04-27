Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9C5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 15:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D56360F3E;
	Wed, 27 Apr 2022 15:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-kL0sBx6wFW; Wed, 27 Apr 2022 15:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F57860EFF;
	Wed, 27 Apr 2022 15:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14C241BF681
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0316383EF0
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 15:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3NCFr-Gdu9k for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 15:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE95083EBB
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 15:41:56 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m20so4182234ejj.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dz8i+VF6MHkX5xXS3EHBMNc7Bum93o6EjtUW8U7wOZw=;
 b=G1lHA+WHmRG1CJ3bd08PPhuJ8mUjWfzO1lmOk5KZ4sqR7a/HhdTaZPeHxX/ur5O+ur
 OiEERjXMjcZBIw0qr/pkKy/x1D6wTqjJ0YB3YvHbz/NlasHdVDh+0PVzObNiYHGu2ThL
 VaOMYbkfBHfuNfln5GcEdgPo7djU6YcVY1lGZZvrHjSr8DtEboN9G/U3ci/8947p6+sY
 oQGJ7eRkYpe1gV/1pfoyyMgVCDIqtHsO0Mwfhjo71HhtMFdfbDgT2tD05LFDMgov0fnj
 Sx8KahsdMcnukdX/gFy/i3j4AS27aoAn9jwbNrxUzsF1RU5XXurisaaymJ5v8nxZg3tJ
 mn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dz8i+VF6MHkX5xXS3EHBMNc7Bum93o6EjtUW8U7wOZw=;
 b=lkBqklR4W3CXxXgVbaJo8yb/mSauaJ5B/k68RGeboql/3iUm/zBc/CJ7vOqDmoA1uK
 uQf3CMvApoXWM6B8fNklm/n8JO7G5Kzq17xiGeAIirhwtd3eO8rKNR4nN/P0h6NkUhuO
 eD5nKEqisF8i24X3aaimiYhncwIgQcdHr/XYRx0cRzSld6h0P+i7EXbi2cOGqzG0xhzY
 ra5J4feg6AcZk4yG5CsaiWVLrh7uk4hbLUDkk9kRrEWdptpijgGTWAxI/4anKDfjMpX1
 Tq0o0M+tfN8U9dm8q5LD1rmHbGRGZ7zDLfIh94piFibNl0AkzDYz0bI/DkgNc3B4QoYZ
 TZBw==
X-Gm-Message-State: AOAM532d8l795iba3QghQ3HCbvwzpjFdBOIW+h/CaS9Kj9gv8HOfMkk9
 xY0dNgW0leIwYl5fXwcNCEUPyw==
X-Google-Smtp-Source: ABdhPJw6Y8cVTTxGQ4QWaGrGqREQButkbjsHg2N487nXRIlgQIO9mJ7tCUJzi6d8qNqag/+fOn+uIQ==
X-Received: by 2002:a17:906:2646:b0:6d5:d889:c92b with SMTP id
 i6-20020a170906264600b006d5d889c92bmr27713344ejc.696.1651074115021; 
 Wed, 27 Apr 2022 08:41:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a170906234100b006ef83025804sm7087888eja.87.2022.04.27.08.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:41:54 -0700 (PDT)
Message-ID: <2c51f9ba-5d02-17f7-98d0-8a4c1b6dcf79@mind.be>
Date: Wed, 27 Apr 2022 17:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
 <20220427103102.7f934c1f@windsurf>
 <CADvTj4og7yAZT69jVo8=5yHSppj7ih7dsUAy6hH+zib7HEi51g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4og7yAZT69jVo8=5yHSppj7ih7dsUAy6hH+zib7HEi51g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 10:42, James Hilliard wrote:
> On Wed, Apr 27, 2022 at 2:31 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello James,
>>
>> On Tue, 26 Apr 2022 21:50:39 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> Libressl is no longer supported as of python 3.10.
>>>
>>> See: https://peps.python.org/pep-0644/#libressl
>>>
>>> Fixes:
>>>   - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>
>> Thanks for your patch. I think it raises one question: is libressl
>> still relevant? Should we still support it?
> 
> Well it's still actively maintained at least.
> 
>>
>> My understanding was that it is not really a successful fork, and in
>> the end, openssl has mostly caught up and remains the de-facto standard
>> implementation. See https://lwn.net/Articles/841664/.
> 
> We do support a number of other rather uncommon ssl implementations
> in general, and at least it's easy enough to disable for unsupported
> configurations.
> 
>>
>> I don't have a very well-informed opinion, but perhaps we should think
>> about this?
> 
> Yeah, not really sure, it may be useful to keep around, I think it has an
> alternative updated API to openssl's updated API that may be desirable
> for some use cases, although probably not the most commonly used.

  At that point, however, having libressl as a virtual package alternative for 
openssl becomes less and less realistic. Virtual packages should only be used if 
the alternatives can be considered drop-in replacements with compatible API. A 
few exceptions are acceptable, but it's becoming too much.

  We should also start thinking what to do with openssl 3. It has an API that is 
somewhat compatible with openssl 1.1.1, but there are almost no packages that 
can use it without any changes. This could actually be an opportunity to get 
aout of this mess: most packages that are not compatible with libressl are 
probably already compatible with openssl 3. So if we introduce an openssl3 
package, we can migrate the packages that don't like libressl to that, and leave 
the choice between openssl 1.1.1 and libressl for legacy and BSD packages.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
