Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD0C282E5
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 18:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E524064F;
	Wed,  5 Mar 2025 18:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wv_I4X5d1qsx; Wed,  5 Mar 2025 18:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2EF40319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2EF40319;
	Wed,  5 Mar 2025 18:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 206BEE2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03AA281184
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pizHttOID5fc for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 18:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4F8881172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F8881172
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4F8881172
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:51:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF29544443;
 Wed,  5 Mar 2025 18:51:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tptpr-00Ew0T-2y;
 Wed, 05 Mar 2025 19:51:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Thomas Perale <thomas.perale@mind.be>,  Thomas
 Devoogdt <thomas.devoogdt@barco.com>
References: <20250304205633.397011-1-thomas.devoogdt@barco.com>
 <20250304205633.397011-2-thomas.devoogdt@barco.com>
Date: Wed, 05 Mar 2025 19:51:15 +0100
In-Reply-To: <20250304205633.397011-2-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Tue, 4 Mar 2025 21:56:33 +0100")
Message-ID: <87frjrgvks.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdfhveegieevgfdugeeghfevveegudegffffhfduhfefgfejhedvtddvfeduheegnecuffhomhgrihhnpehphihthhhonhdrohhrghdpsghuihhlughrohhothdrohhrghenucfkphepudelhedrudeivddrudekhedrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelhedrudeivddrudekhedrvddupdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdguvghvohhoghguthessggrrhgtohdrtghom
 h
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] utils/generate-cyclonedx: add an option
 to pretty print the output
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > The indent is passed to json.dump, as described in:
 > https://docs.python.org/3/library/json.html#json.dump

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

I take it this is meant as an alternative to piping it to jq? Maybe we
should just always indent with a "sane" level (I believe jq uses 2) and
the comments about using jq dropped?

> ---
 >  utils/generate-cyclonedx | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 > index 39d59173d2e..33e06ea86aa 100755
 > --- a/utils/generate-cyclonedx
 > +++ b/utils/generate-cyclonedx
 > @@ -277,6 +277,9 @@ def main():
 >                          default=(None if sys.stdin.isatty() else sys.stdin))
 >      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
 >                          default=sys.stdout)
 > +    parser.add_argument("--indent", default=None, type=int,
 > +                        help="If given, then JSON array elements and object members will be pretty-printed with that "
 > +                             "indent level")
 >      parser.add_argument("--virtual", default=False, action='store_true',
 >                          help="This option includes virtual packages to the CycloneDX output")
 
 > @@ -316,7 +319,7 @@ def main():
 >          },
 >      }
 
 > -    args.out_file.write(json.dumps(cyclonedx_dict))
 > +    args.out_file.write(json.dumps(cyclonedx_dict, indent=args.indent))
 
 
 >  if __name__ == "__main__":
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
