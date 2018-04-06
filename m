From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 6 Apr 2018 10:38:46 -0500
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <20180406171331.5b6891f9@windsurf>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CANQCQpZgjJqSpY9Pma9wsB=QtPL5onLYLb5pdteTSUULOcMF-A@mail.gmail.com>
 <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <20180406171331.5b6891f9@windsurf>
Message-ID: <CANQCQpZPBLYNaVjq3m3+_+B6Dbi8Mv1F-E4+TSPiNgPyW4gb=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Apr 6, 2018 at 10:13 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 6 Apr 2018 15:02:55 +0000, Chris Brandt wrote:
>
>>  > It is missing the new case where the compressed block length is stored
>>  > as an u16 at the beginning of the block. That's pretty much the only use
>>  > of u16 in the code so easy to locate.
>>
>> So then in that case, you would need a bswap_32() and a bswap_16() macro.
>>
>> However...that code is currently inside a "} else if (0) {" block, so it
>> looks like it will never get executed anyway.
>
> I don't see where this else if (0) block is. Where do you see that ?
>
> Matthew: the current patch in Buildroot also fixes cramfsck, but not
> your contribution on the new version of the cramfs tools.
>

Oh good catch, I missed that.  I'll update that in v2 and refresh my
upstream pull request.
