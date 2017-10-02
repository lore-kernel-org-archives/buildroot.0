From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Oct 2017 15:48:51 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
In-Reply-To: <20171002060649.GC4753@scaer>
References: <20170929080419.GA2899@scaer>
 <59d191cdafd96_6a703fce1469bdfc55573@ultri3.mail>
 <20171002060649.GC4753@scaer>
Message-ID: <4fe624ec-385e-9f16-88c5-2cf6ca773dd6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-10-17 08:06, Yann E. MORIN wrote:
>> If we follow this path of adopting command line arguments or a config file,
>> don't worry about the test files in the package directories
>> (http://patchwork.ozlabs.org/patch/814544/), I will send a RFC patch that also
>> checks files pointed by symlinks.
>>
>> The bikeshedding challenge is to define the magic number: 100? 132? 150?
> I did not choose 132 randomly; I choose it for a reason.
> 
> https://en.wikipedia.org/wiki/132_(number)
> 
> The number of columns of a Line printer printing in landscape mode on
> 14-inch paper.  /(while in portrait it was 80)/
> 
> Also, 132 was the alternative line width on a VT (vt200? my memory of
> it is a bit fuzzy... ;-] )
> 
> So, 132 is a good fit. ;-)

 I don't agree :-)

 For me, the ideal is to wrap at 80 columns most of the time, but allow
exceptions up to something like 105 columns. 105 is still reasonable for
side-by-side on a wide display with some room for scrollbars. I know, Yann, that
you can easily fit 132 characters on side-by-side, but you've got an eagle-eyed
font size :-) That said, I can live with 132 as the absolute maximum. However, I
do think we should _normally_ wrap at 80 columns.

 Standardizing on 80 columns is good because it's what we do in the rest of
Buildroot. Allowing exceptions is good because there are some lines you really
don't want to split (strings, mostly).

 So ideally, I'd like to have a warning for anything about 80 columns, and an
error for anything over 105 (or 132). Unfortunately, I don't think flake8 allows
that. So let's say we put 132 in the config file, but enforce 80 columns in review.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
