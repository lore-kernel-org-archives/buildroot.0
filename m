Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451BC409BA;
	Sun, 27 Mar 2022 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4UCMYCJ5bVo; Sun, 27 Mar 2022 19:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75E741560;
	Sun, 27 Mar 2022 19:36:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2A6F1BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC1441560
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_iKY6wKmPDN for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:36:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44418409BA
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 19:36:45 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id c10so6229616ejs.13
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V+GrwclaJ/tcHCEqQrZrfmlfOPFLeWotAcsT2yYS2X8=;
 b=DMJNtrOLDEMZRhxceEcvnCZEdYxJFVUEdcpZwiwgUr3zOHyYkG9t1n0pBkBU8wk8Si
 2f0SdstD47uhP/RNVeq9n2KWD95fIA2NYwxZfTQ7OdlCi3Ru/nphaInAf14Aq8SrwTy5
 w2QxT1gRkcb27wGvrV0YqkYRtGxLF+/0oxr2JF3IGsBXrtXAGv4IG24SAzYqWJ8H8i49
 azZAEMqG6HoRYple8yMa9Bqahj97++DUIhNDFyOdmfy47XuuDwYSvxJ2J3DuNjG/3gvy
 IBY7OsbY5nm+qLqg8lR8sD3lutjiLSo8QmhspcqnduoVjdwt/2r2AnBbvir+SiKaVYXZ
 CExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V+GrwclaJ/tcHCEqQrZrfmlfOPFLeWotAcsT2yYS2X8=;
 b=h+32de9OqEh6eKGg+8i3dJmVsRvGyQrEgHuz9ax4JdAXPJNxhH1h2UVKS++zQJzCsP
 V2hMPHNdPMF0D+VUxzyE3L23+NoszDRupPrMqpTOrY+e9022jGrVVr7vA+I6r64KySGp
 Awtd4n6tEhgRFOOJgbcoRxmWHWpAKMHPkjeAMrLaDtI6k9w6KnnPPNxiMrpUci1g+TjR
 Q+XqkjNdMZCaMrYAAiqO00b9JzgFwC2lLZVXMGJxOYm6dP43AjkECPAgN0ipdWuz+GN4
 yzfBVhlIF/kJUCfWYPyF67XXQAFKEudA0HnWEWBRq3Chb1qcWvBSEtrgxE3w+mHeJjZf
 Joiw==
X-Gm-Message-State: AOAM533T8iEQX8aX5wSfUfUMf7I9MOSblLEPizOYVrK7E2bjfBazXw7w
 ge/Ka+WiyKe86cgTfMMDF0COxg==
X-Google-Smtp-Source: ABdhPJyNpK1gK+bLgn5QYPUT6VN7PKhfDY6QdQ+ObZTO3hU42XOnEdYDxNLzUFz/jdqNCZa6eMAiuA==
X-Received: by 2002:a17:906:e4c:b0:6e0:b002:2b2e with SMTP id
 q12-20020a1709060e4c00b006e0b0022b2emr13702361eji.690.1648409803318; 
 Sun, 27 Mar 2022 12:36:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm4870916ejc.153.2022.03.27.12.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 12:36:42 -0700 (PDT)
Message-ID: <8fa95711-9442-c1b9-5ddc-9e1c7859f802@mind.be>
Date: Sun, 27 Mar 2022 21:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220327054814.942198-1-Jason@zx2c4.com>
 <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 20:01, James Hilliard wrote:
> On Sat, Mar 26, 2022 at 11:48 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> The RNG can't actually be seeded from a shell script, due to the
>> reliance on ioctls. For this reason, the seedrng project provides a
>> basic script meant to be copy and pasted into projects like buildroot
>> and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
>>
>> This commit imports it into buildroot and wires up the init scripts to
>> call it. This also is a significant improvement over the current init
>> script, which doesn't credit entropy and whose hashing in shell scripts
>> is sort of fragile.
>>
>> As seedrng.c is a short tiny C program, we include this here in the
>> package, like a few other packages do. Later we'll investigate adding
>> this to busybox, but for now, this is a good start and a positive step
>> in the right direction.
>>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[snip]
>> +#ifndef GRND_INSECURE
>> +#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
>> +#endif
>> +
>> +#ifndef LOCALSTATEDIR
>> +#define LOCALSTATEDIR "/var/lib"
>> +#endif
>> +#ifndef RUNSTATEDIR
>> +#define RUNSTATEDIR "/var/run"
>> +#endif
> 
> Might be a good idea to have runtime env overrides for these to allow easier
> path customization by only having to override the init script in a
> rootfs overlay:
> https://buildroot.org/downloads/manual/manual.html#rootfs-custom
> 
> Maybe something similar to the SEEDRNG_SKIP_CREDIT env override would
> make sense for these paths.

  I don't know if that makes sense. Dozens of buildroot packages hardocde these 
paths already.

  Regards,
  Arnout

> 
>> +
>> +#define SEED_DIR LOCALSTATEDIR "/seedrng"
>> +#define CREDITABLE_SEED SEED_DIR "/seed.credit"
>> +#define NON_CREDITABLE_SEED SEED_DIR "/seed.no-credit"
>> +#define LOCK_FILE RUNSTATEDIR "/seedrng.lock"
>> +
>> +enum blake2s_lengths {
>> +       BLAKE2S_BLOCK_LEN = 64,
>> +       BLAKE2S_HASH_LEN = 32,
>> +       BLAKE2S_KEY_LEN = 32
>> +};
>> +
>> +enum seedrng_lengths {
>> +       MAX_SEED_LEN = 512,
>> +       MIN_SEED_LEN = BLAKE2S_HASH_LEN
>> +};
>> +
>> +struct blake2s_state {
>> +       uint32_t h[8];
>> +       uint32_t t[2];
>> +       uint32_t f[2];
>> +       uint8_t buf[BLAKE2S_BLOCK_LEN];
>> +       unsigned int buflen;
>> +       unsigned int outlen;
>> +};
>> +
>> +#define le32_to_cpup(a) le32toh(*(a))
>> +#define cpu_to_le32(a) htole32(a)
>> +#ifndef ARRAY_SIZE
>> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>> +#endif
>> +#ifndef DIV_ROUND_UP
>> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>> +#endif
>> +
>> +static inline void cpu_to_le32_array(uint32_t *buf, unsigned int words)
>> +{
>> +        while (words--) {
>> +               *buf = cpu_to_le32(*buf);
>> +               ++buf;
>> +       }
>> +}
>> +
>> +static inline void le32_to_cpu_array(uint32_t *buf, unsigned int words)
>> +{
>> +        while (words--) {
>> +               *buf = le32_to_cpup(buf);
>> +               ++buf;
>> +        }
>> +}
>> +
>> +static inline uint32_t ror32(uint32_t word, unsigned int shift)
>> +{
>> +       return (word >> (shift & 31)) | (word << ((-shift) & 31));
>> +}
>> +
>> +static const uint32_t blake2s_iv[8] = {
>> +       0x6A09E667UL, 0xBB67AE85UL, 0x3C6EF372UL, 0xA54FF53AUL,
>> +       0x510E527FUL, 0x9B05688CUL, 0x1F83D9ABUL, 0x5BE0CD19UL
>> +};
>> +
>> +static const uint8_t blake2s_sigma[10][16] = {
>> +       { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
>> +       { 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
>> +       { 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
>> +       { 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
>> +       { 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
>> +       { 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
>> +       { 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
>> +       { 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
>> +       { 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
>> +       { 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
>> +};
>> +
>> +static void blake2s_set_lastblock(struct blake2s_state *state)
>> +{
>> +       state->f[0] = -1;
>> +}
>> +
>> +static void blake2s_increment_counter(struct blake2s_state *state, const uint32_t inc)
>> +{
>> +       state->t[0] += inc;
>> +       state->t[1] += (state->t[0] < inc);
>> +}
>> +
>> +static void blake2s_init_param(struct blake2s_state *state, const uint32_t param)
>> +{
>> +       int i;
>> +
>> +       memset(state, 0, sizeof(*state));
>> +       for (i = 0; i < 8; ++i)
>> +               state->h[i] = blake2s_iv[i];
>> +       state->h[0] ^= param;
>> +}
>> +
>> +static void blake2s_init(struct blake2s_state *state, const size_t outlen)
>> +{
>> +       blake2s_init_param(state, 0x01010000 | outlen);
>> +       state->outlen = outlen;
>> +}
>> +
>> +static void blake2s_compress(struct blake2s_state *state, const uint8_t *block, size_t nblocks, const uint32_t inc)
>> +{
>> +       uint32_t m[16];
>> +       uint32_t v[16];
>> +       int i;
>> +
>> +       while (nblocks > 0) {
>> +               blake2s_increment_counter(state, inc);
>> +               memcpy(m, block, BLAKE2S_BLOCK_LEN);
>> +               le32_to_cpu_array(m, ARRAY_SIZE(m));
>> +               memcpy(v, state->h, 32);
>> +               v[ 8] = blake2s_iv[0];
>> +               v[ 9] = blake2s_iv[1];
>> +               v[10] = blake2s_iv[2];
>> +               v[11] = blake2s_iv[3];
>> +               v[12] = blake2s_iv[4] ^ state->t[0];
>> +               v[13] = blake2s_iv[5] ^ state->t[1];
>> +               v[14] = blake2s_iv[6] ^ state->f[0];
>> +               v[15] = blake2s_iv[7] ^ state->f[1];
>> +
>> +#define G(r, i, a, b, c, d) do { \
>> +       a += b + m[blake2s_sigma[r][2 * i + 0]]; \
>> +       d = ror32(d ^ a, 16); \
>> +       c += d; \
>> +       b = ror32(b ^ c, 12); \
>> +       a += b + m[blake2s_sigma[r][2 * i + 1]]; \
>> +       d = ror32(d ^ a, 8); \
>> +       c += d; \
>> +       b = ror32(b ^ c, 7); \
>> +} while (0)
>> +
>> +#define ROUND(r) do { \
>> +       G(r, 0, v[0], v[ 4], v[ 8], v[12]); \
>> +       G(r, 1, v[1], v[ 5], v[ 9], v[13]); \
>> +       G(r, 2, v[2], v[ 6], v[10], v[14]); \
>> +       G(r, 3, v[3], v[ 7], v[11], v[15]); \
>> +       G(r, 4, v[0], v[ 5], v[10], v[15]); \
>> +       G(r, 5, v[1], v[ 6], v[11], v[12]); \
>> +       G(r, 6, v[2], v[ 7], v[ 8], v[13]); \
>> +       G(r, 7, v[3], v[ 4], v[ 9], v[14]); \
>> +} while (0)
>> +               ROUND(0);
>> +               ROUND(1);
>> +               ROUND(2);
>> +               ROUND(3);
>> +               ROUND(4);
>> +               ROUND(5);
>> +               ROUND(6);
>> +               ROUND(7);
>> +               ROUND(8);
>> +               ROUND(9);
>> +
>> +#undef G
>> +#undef ROUND
>> +
>> +               for (i = 0; i < 8; ++i)
>> +                       state->h[i] ^= v[i] ^ v[i + 8];
>> +
>> +               block += BLAKE2S_BLOCK_LEN;
>> +               --nblocks;
>> +       }
>> +}
>> +
>> +static void blake2s_update(struct blake2s_state *state, const void *inp, size_t inlen)
>> +{
>> +       const size_t fill = BLAKE2S_BLOCK_LEN - state->buflen;
>> +       const uint8_t *in = inp;
>> +
>> +       if (!inlen)
>> +               return;
>> +       if (inlen > fill) {
>> +               memcpy(state->buf + state->buflen, in, fill);
>> +               blake2s_compress(state, state->buf, 1, BLAKE2S_BLOCK_LEN);
>> +               state->buflen = 0;
>> +               in += fill;
>> +               inlen -= fill;
>> +       }
>> +       if (inlen > BLAKE2S_BLOCK_LEN) {
>> +               const size_t nblocks = DIV_ROUND_UP(inlen, BLAKE2S_BLOCK_LEN);
>> +               blake2s_compress(state, in, nblocks - 1, BLAKE2S_BLOCK_LEN);
>> +               in += BLAKE2S_BLOCK_LEN * (nblocks - 1);
>> +               inlen -= BLAKE2S_BLOCK_LEN * (nblocks - 1);
>> +       }
>> +       memcpy(state->buf + state->buflen, in, inlen);
>> +       state->buflen += inlen;
>> +}
>> +
>> +static void blake2s_final(struct blake2s_state *state, uint8_t *out)
>> +{
>> +       blake2s_set_lastblock(state);
>> +       memset(state->buf + state->buflen, 0, BLAKE2S_BLOCK_LEN - state->buflen);
>> +       blake2s_compress(state, state->buf, 1, state->buflen);
>> +       cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
>> +       memcpy(out, state->h, state->outlen);
>> +}
>> +
>> +static size_t determine_optimal_seed_len(void)
>> +{
>> +       size_t ret = 0;
>> +       char poolsize_str[11] = { 0 };
>> +       int fd = open("/proc/sys/kernel/random/poolsize", O_RDONLY);
>> +
>> +       if (fd < 0 || read(fd, poolsize_str, sizeof(poolsize_str) - 1) < 0) {
>> +               fprintf(stderr, "WARNING: Unable to determine pool size, falling back to %u bits: %s\n", MIN_SEED_LEN * 8, strerror(errno));
>> +               ret = MIN_SEED_LEN;
>> +       } else
>> +               ret = DIV_ROUND_UP(strtoul(poolsize_str, NULL, 10), 8);
>> +       if (fd >= 0)
>> +               close(fd);
>> +       if (ret < MIN_SEED_LEN)
>> +               ret = MIN_SEED_LEN;
>> +       else if (ret > MAX_SEED_LEN)
>> +               ret = MAX_SEED_LEN;
>> +       return ret;
>> +}
>> +
>> +static int read_new_seed(uint8_t *seed, size_t len, bool *is_creditable)
>> +{
>> +       ssize_t ret;
>> +       int urandom_fd;
>> +
>> +       *is_creditable = false;
>> +       ret = getrandom(seed, len, GRND_NONBLOCK);
>> +       if (ret == (ssize_t)len) {
>> +               *is_creditable = true;
>> +               return 0;
>> +       } else if (ret < 0 && errno == ENOSYS) {
>> +               struct pollfd random_fd = {
>> +                       .fd = open("/dev/random", O_RDONLY),
>> +                       .events = POLLIN
>> +               };
>> +               if (random_fd.fd < 0)
>> +                       return -errno;
>> +               *is_creditable = poll(&random_fd, 1, 0) == 1;
>> +               close(random_fd.fd);
>> +       } else if (getrandom(seed, len, GRND_INSECURE) == (ssize_t)len)
>> +               return 0;
>> +       urandom_fd = open("/dev/urandom", O_RDONLY);
>> +       if (urandom_fd < 0)
>> +               return -errno;
>> +       ret = read(urandom_fd, seed, len);
>> +       if (ret == (ssize_t)len)
>> +               ret = 0;
>> +       else
>> +               ret = -errno ? -errno : -EIO;
>> +       close(urandom_fd);
>> +       return ret;
>> +}
>> +
>> +static int seed_rng(uint8_t *seed, size_t len, bool credit)
>> +{
>> +       struct {
>> +               int entropy_count;
>> +               int buf_size;
>> +               uint8_t buffer[MAX_SEED_LEN];
>> +       } req = {
>> +               .entropy_count = credit ? len * 8 : 0,
>> +               .buf_size = len
>> +       };
>> +       int random_fd, ret;
>> +
>> +       if (len > sizeof(req.buffer))
>> +               return -EFBIG;
>> +       memcpy(req.buffer, seed, len);
>> +
>> +       random_fd = open("/dev/random", O_RDWR);
>> +       if (random_fd < 0)
>> +               return -errno;
>> +       ret = ioctl(random_fd, RNDADDENTROPY, &req);
>> +       if (ret)
>> +               ret = -errno ? -errno : -EIO;
>> +       close(random_fd);
>> +       return ret;
>> +}
>> +
>> +static int seed_from_file_if_exists(const char *filename, bool credit, struct blake2s_state *hash)
>> +{
>> +       uint8_t seed[MAX_SEED_LEN];
>> +       ssize_t seed_len;
>> +       int fd, dfd, ret = 0;
>> +
>> +       fd = open(filename, O_RDONLY);
>> +       if (fd < 0 && errno == ENOENT)
>> +               return 0;
>> +       else if (fd < 0) {
>> +               ret = -errno;
>> +               fprintf(stderr, "ERROR: Unable to open seed file: %s\n", strerror(errno));
>> +               return ret;
>> +       }
>> +       dfd = open(SEED_DIR, O_DIRECTORY | O_RDONLY);
>> +       if (dfd < 0) {
>> +               ret = -errno;
>> +               close(fd);
>> +               fprintf(stderr, "ERROR: Unable to open seed directory: %s\n", strerror(errno));
>> +               return ret;
>> +       }
>> +       seed_len = read(fd, seed, sizeof(seed));
>> +       if (seed_len < 0) {
>> +               ret = -errno;
>> +               fprintf(stderr, "ERROR: Unable to read seed file: %s\n", strerror(errno));
>> +       }
>> +       close(fd);
>> +       if (ret) {
>> +               close(dfd);
>> +               return ret;
>> +       }
>> +       if ((unlink(filename) < 0 || fsync(dfd) < 0) && seed_len) {
>> +               ret = -errno;
>> +               fprintf(stderr, "ERROR: Unable to remove seed after reading, so not seeding: %s\n", strerror(errno));
>> +       }
>> +       close(dfd);
>> +       if (ret)
>> +               return ret;
>> +       if (!seed_len)
>> +               return 0;
>> +
>> +       blake2s_update(hash, &seed_len, sizeof(seed_len));
>> +       blake2s_update(hash, seed, seed_len);
>> +
>> +       fprintf(stdout, "Seeding %zd bits %s crediting\n", seed_len * 8, credit ? "and" : "without");
>> +       ret = seed_rng(seed, seed_len, credit);
>> +       if (ret < 0)
>> +               fprintf(stderr, "ERROR: Unable to seed: %s\n", strerror(-ret));
>> +       return ret;
>> +}
>> +
>> +static bool skip_credit(void)
>> +{
>> +       const char *skip = getenv("SEEDRNG_SKIP_CREDIT");
>> +       return skip && (!strcmp(skip, "1") || !strcasecmp(skip, "true") ||
>> +                       !strcasecmp(skip, "yes") || !strcasecmp(skip, "y"));
>> +}
>> +
>> +int main(int argc __attribute__((unused)), char *argv[] __attribute__((unused)))
>> +{
>> +       static const char seedrng_prefix[] = "SeedRNG v1 Old+New Prefix";
>> +       static const char seedrng_failure[] = "SeedRNG v1 No New Seed Failure";
>> +       int ret, fd, lock, program_ret = 0;
>> +       uint8_t new_seed[MAX_SEED_LEN];
>> +       size_t new_seed_len;
>> +       bool new_seed_creditable;
>> +       struct timespec realtime = { 0 }, boottime = { 0 };
>> +       struct blake2s_state hash;
>> +
>> +       umask(0077);
>> +       if (getuid()) {
>> +               fprintf(stderr, "ERROR: This program requires root\n");
>> +               return 1;
>> +       }
>> +
>> +       blake2s_init(&hash, BLAKE2S_HASH_LEN);
>> +       blake2s_update(&hash, seedrng_prefix, strlen(seedrng_prefix));
>> +       clock_gettime(CLOCK_REALTIME, &realtime);
>> +       clock_gettime(CLOCK_BOOTTIME, &boottime);
>> +       blake2s_update(&hash, &realtime, sizeof(realtime));
>> +       blake2s_update(&hash, &boottime, sizeof(boottime));
>> +
>> +       if (mkdir(SEED_DIR, 0700) < 0 && errno != EEXIST) {
>> +               fprintf(stderr, "ERROR: Unable to create \"%s\" directory: %s\n", SEED_DIR, strerror(errno));
>> +               return 1;
>> +       }
>> +
>> +       lock = open(LOCK_FILE, O_WRONLY | O_CREAT, 0000);
>> +       if (lock < 0 || flock(lock, LOCK_EX) < 0) {
>> +               fprintf(stderr, "ERROR: Unable to open lock file: %s\n", strerror(errno));
>> +               return 1;
>> +       }
>> +
>> +       ret = seed_from_file_if_exists(NON_CREDITABLE_SEED, false, &hash);
>> +       if (ret < 0)
>> +               program_ret |= 1 << 1;
>> +       ret = seed_from_file_if_exists(CREDITABLE_SEED, !skip_credit(), &hash);
>> +       if (ret < 0)
>> +               program_ret |= 1 << 2;
>> +
>> +       new_seed_len = determine_optimal_seed_len();
>> +       ret = read_new_seed(new_seed, new_seed_len, &new_seed_creditable);
>> +       if (ret < 0) {
>> +               fprintf(stderr, "ERROR: Unable to read new seed: %s\n", strerror(-ret));
>> +               new_seed_len = BLAKE2S_HASH_LEN;
>> +               strncpy((char *)new_seed, seedrng_failure, new_seed_len);
>> +               program_ret |= 1 << 3;
>> +       }
>> +       blake2s_update(&hash, &new_seed_len, sizeof(new_seed_len));
>> +       blake2s_update(&hash, new_seed, new_seed_len);
>> +       blake2s_final(&hash, new_seed + new_seed_len - BLAKE2S_HASH_LEN);
>> +
>> +       fprintf(stdout, "Saving %zu bits of %s seed for next boot\n", new_seed_len * 8, new_seed_creditable ? "creditable" : "non-creditable");
>> +       fd = open(NON_CREDITABLE_SEED, O_WRONLY | O_CREAT | O_TRUNC, 0400);
>> +       if (fd < 0) {
>> +               fprintf(stderr, "ERROR: Unable to open seed file for writing: %s\n", strerror(errno));
>> +               program_ret |= 1 << 4;
>> +               goto out;
>> +       }
>> +       if (write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len || fsync(fd) < 0) {
>> +               fprintf(stderr, "ERROR: Unable to write seed file: %s\n", strerror(errno));
>> +               program_ret |= 1 << 5;
>> +               goto out;
>> +       }
>> +       if (new_seed_creditable && rename(NON_CREDITABLE_SEED, CREDITABLE_SEED) < 0) {
>> +               fprintf(stderr, "WARNING: Unable to make new seed creditable: %s\n", strerror(errno));
>> +               program_ret |= 1 << 6;
>> +       }
>> +out:
>> +       close(fd);
>> +       close(lock);
>> +       return program_ret;
>> +}
>> diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
>> index 2c09728c46..a5cbb95feb 100644
>> --- a/package/urandom-scripts/urandom-scripts.mk
>> +++ b/package/urandom-scripts/urandom-scripts.mk
>> @@ -4,7 +4,17 @@
>>   #
>>   ################################################################################
>>
>> +define URANDOM_SCRIPTS_EXTRACT_CMDS
>> +       cp $(URANDOM_SCRIPTS_PKGDIR)/seedrng.c $(@D)
>> +endef
>> +
>> +define URANDOM_SCRIPTS_BUILD_CMDS
>> +       $(TARGET_CC) $(TARGET_CFLAGS) -std=gnu99 $(TARGET_LDFLAGS) \
>> +               $(@D)/seedrng.c -o $(@D)/seedrng
>> +endef
>> +
>>   define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
>> +       $(INSTALL) -D -m 0755 $(@D)/seedrng $(TARGET_DIR)/sbin/seedrng
>>          $(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20urandom \
>>                  $(TARGET_DIR)/etc/init.d/S20urandom
>>   endef
>> --
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
