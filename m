From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 18 Feb 2011 00:04:19 +0100
Subject: [Buildroot] [PATCH] Makefile: improve $(TARGET_DIR) (re)creation
In-Reply-To: <AANLkTinpwJLrZ1zJ5TwnjnzDG+ad+aAqQgW8B8B5QsiY@mail.gmail.com>
References: <1297627745-17087-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi==jLjhNbswUC1wsgUySjB_kM_7VD1Ns9mQoMsE@mail.gmail.com>
	<AANLkTikvPodMe8ZGmo452Zn_hBU5c2S=2RpMNYKOoMAP@mail.gmail.com>
	<AANLkTi=jtfZmP=BqvhxoQxLLRyFpj0p3=Z_b0WguBu_y@mail.gmail.com>
	<AANLkTim9oR5GthXJcfJsi70qNfZEX3gXDNVOAx+ptq-F@mail.gmail.com>
	<AANLkTinrGKji5vpczhHyHO1ezzbFHx6C=nRsF3iMOSL4@mail.gmail.com>
	<AANLkTinpwJLrZ1zJ5TwnjnzDG+ad+aAqQgW8B8B5QsiY@mail.gmail.com>
Message-ID: <AANLkTimMndxOpgqrtxo3WYMMu9wLjinfW6CgiWz9KQLG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 February 2011 08:40, Daniel Nystr?m
<daniel.nystrom@timeterminal.se> wrote:
> 2011/2/16 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>>
>> rm output/build/*/.stamp*
>>
>> (works for packages using the auto/generic/cmake infrastructure)
>>
>> or `make package-uninstall package` to rebuild a single package.
>
> Doing so, you can do "make clean" as well, since every package will be
> reextracted and patched and rebuilt. Or am I missing something?

I think "make clean" does more than you'd like in that situation. Here
is what it does:

clean:
	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
		$(TOOLCHAIN_EXTERNAL_DIR)

It takes *everything* except the config and download dir.

> I guess rm build/*/.stamp_{built,{staging,target}_installed} would be
> what I'm after, but giving your first patch a second look, I notice
> you already got rm .stamp_target_installed which should be enough for
> recreating the target dir (which was your original intention).
>
> I also looks like any package version bumps would be handled correctly
> on target recreation, which will probably solve most scenarios.
>
> My vote is to apply your patch (when you consider it complete) and if
> there will still be any case not covered by it, we just deal with that
> later on.
>
> Thanks alot for looking into this by the way!

I'm just scratching my own itch :-) Glad you like it.

Patch v2 coming soon.

Best regards,
Bj?rn Forsman
