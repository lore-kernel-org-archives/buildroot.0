From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Thu, 19 Apr 2018 07:57:29 +0000
Subject: [Buildroot] [PATCH 2/3] dropbear: Add configuration options for
 security features
In-Reply-To: <533c6880-ac31-b6cc-166f-7c973ecdef5e@mind.be>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
 <20180418142434.7268-2-stefan.sorensen@spectralink.com>
 <533c6880-ac31-b6cc-166f-7c973ecdef5e@mind.be>
Message-ID: <11a83465fbdd005cfcd1db11902f7607c4269373.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-04-18 at 23:58 +0200, Arnout Vandecappelle wrote:
> 
> On 18-04-18 16:24, Stefan S?rensen wrote:
> > 
> > These new options allow the selection of
> >   Ciphers (AES128, AES256, 3DES, BLowfish, Twofish128, Twofish256)
> >   Cipher modes (CBC, CTR)
> >   Integrity algorithms (SHA1, SHA1-96, SHA2-256, SHA2-512, MD5)
> >   Key exchange algorithms (RSA, DSS, ECDSA, Curve25519, ECDH)
> >   Authenticaton types (Password, Pubkey)
> > 
> > No defaults are changed.
> > 
> > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> > ---
>  package/dropbear/Config.in   | 163
> +++++++++++++++++++++++++++++++++++
>  Do we really want so many configuration options?

Yes, it is a lot of options. So what about:

   By default, enable the common and secure options (AES, CTR, SHA2,  
   ECDSA, Curve25519, Pubkey).

   Add an option to enable legacy/insecure options (3DES, CBC, SHA1-96, 
   MD5, RSA).

   Add an option to enable password authentication

   Drop Blowfish and Twofish configuration.


Stefan
