From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:40:33 +0000 (UTC)
Subject: [Buildroot] [Bug 3301] New: mpd fails to build on x86 due to
 missing __tls_get_addr
Message-ID: <bug-3301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3301

           Summary: mpd fails to build on x86 due to missing
                    __tls_get_addr
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/home/test/toolchains/ctng-i586-geode-linux-uclibc/bin/i586-geode-linux-uclibc-g++
--sysroot=/home/test/outputs/test-380/host/usr/i386-unknown-linux-uclibc/sysroot
 -pipe -Os  -mtune=i386 -march=i386 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 
-L/home/test/outputs/test-380/host/usr/i386-unknown-linux-uclibc/sysroot/lib
-L/home/test/outputs/test-380/host/usr/i386-unknown-linux-uclibc/sysroot/usr/lib
-o src/mpd      src/src_mpd-input_init.o src/src_mpd-input_registry.o
src/src_mpd-input_stream.o src/input/src_mpd-rewind_input_plugin.o
src/input/src_mpd-file_input_plugin.o   
src/playlist/src_mpd-extm3u_playlist_plugin.o
src/playlist/src_mpd-m3u_playlist_plugin.o
src/playlist/src_mpd-pls_playlist_plugin.o
src/playlist/src_mpd-xspf_playlist_plugin.o
src/playlist/src_mpd-asx_playlist_plugin.o
src/playlist/src_mpd-rss_playlist_plugin.o src/src_mpd-playlist_list.o  
src/playlist/src_mpd-flac_playlist_plugin.o src/src_mpd-ape.o
src/src_mpd-replay_gain_ape.o src/src_mpd-tag_ape.o 
src/src_mpd-decoder_buffer.o src/src_mpd-decoder_plugin.o
src/src_mpd-decoder_list.o       src/decoder/src_mpd-_ogg_common.o
src/decoder/src_mpd-flac_metadata.o src/decoder/src_mpd-flac_pcm.o
src/decoder/src_mpd-_flac_common.o  src/decoder/src_mpd-flac_decoder_plugin.o  
        src/src_mpd-encoder_list.o src/encoder/src_mpd-null_encoder.o
src/encoder/src_mpd-wave_encoder.o    src/encoder/src_mpd-flac_encoder.o
src/src_mpd-output_list.o src/src_mpd-output_all.o src/src_mpd-output_thread.o
src/src_mpd-output_control.o src/src_mpd-output_state.o
src/src_mpd-output_print.o src/src_mpd-output_command.o
src/src_mpd-output_init.o src/output/src_mpd-null_plugin.o   
src/output/src_mpd-fifo_output_plugin.o    src/output/src_mpd-oss_plugin.o    
src/output/src_mpd-recorder_output_plugin.o src/src_mpd-icy_server.o
src/output/src_mpd-httpd_client.o src/output/src_mpd-httpd_output_plugin.o  
src/src_mpd-mixer_control.o src/src_mpd-mixer_type.o src/src_mpd-mixer_all.o
src/src_mpd-mixer_api.o src/mixer/src_mpd-software_mixer_plugin.o 
src/mixer/src_mpd-oss_mixer_plugin.o   src/filter/src_mpd-null_filter_plugin.o
src/filter/src_mpd-chain_filter_plugin.o
src/filter/src_mpd-autoconvert_filter_plugin.o
src/filter/src_mpd-convert_filter_plugin.o
src/filter/src_mpd-route_filter_plugin.o
src/filter/src_mpd-normalize_filter_plugin.o
src/filter/src_mpd-replay_gain_filter_plugin.o
src/filter/src_mpd-volume_filter_plugin.o src/src_mpd-notify.o
src/src_mpd-audio.o src/src_mpd-audio_check.o src/src_mpd-audio_format.o
src/src_mpd-audio_parser.o src/src_mpd-command.o src/src_mpd-idle.o
src/src_mpd-cmdline.o src/src_mpd-conf.o src/src_mpd-crossfade.o
src/src_mpd-dbUtils.o src/src_mpd-decoder_thread.o
src/src_mpd-decoder_control.o src/src_mpd-decoder_api.o
src/src_mpd-decoder_internal.o src/src_mpd-decoder_print.o
src/src_mpd-directory.o src/src_mpd-directory_save.o
src/src_mpd-directory_print.o src/src_mpd-database.o src/src_mpd-dirvec.o
src/src_mpd-exclude.o src/src_mpd-fd_util.o src/src_mpd-fifo_buffer.o
src/src_mpd-filter_config.o src/src_mpd-filter_plugin.o
src/src_mpd-filter_registry.o src/src_mpd-update.o src/src_mpd-update_queue.o
src/src_mpd-update_walk.o src/src_mpd-update_remove.o src/src_mpd-client.o
src/src_mpd-client_event.o src/src_mpd-client_expire.o
src/src_mpd-client_global.o src/src_mpd-client_idle.o src/src_mpd-client_list.o
src/src_mpd-client_new.o src/src_mpd-client_process.o src/src_mpd-client_read.o
src/src_mpd-client_write.o src/src_mpd-server_socket.o src/src_mpd-listen.o
src/src_mpd-log.o src/src_mpd-ls.o src/src_mpd-main.o src/src_mpd-main_win32.o
src/src_mpd-event_pipe.o src/src_mpd-daemon.o
src/AudioCompress/src_mpd-compress.o src/src_mpd-buffer.o src/src_mpd-pipe.o
src/src_mpd-chunk.o src/src_mpd-path.o src/src_mpd-mapper.o src/src_mpd-page.o
src/src_mpd-pcm_convert.o src/src_mpd-pcm_volume.o src/src_mpd-pcm_mix.o
src/src_mpd-pcm_byteswap.o src/src_mpd-pcm_channels.o src/src_mpd-pcm_pack.o
src/src_mpd-pcm_format.o src/src_mpd-pcm_resample.o
src/src_mpd-pcm_resample_fallback.o src/src_mpd-pcm_dither.o
src/src_mpd-permission.o src/src_mpd-player_thread.o
src/src_mpd-player_control.o src/src_mpd-playlist.o
src/src_mpd-playlist_global.o src/src_mpd-playlist_control.o
src/src_mpd-playlist_edit.o src/src_mpd-playlist_print.o
src/src_mpd-playlist_save.o src/src_mpd-playlist_mapper.o
src/src_mpd-playlist_any.o src/src_mpd-playlist_song.o
src/src_mpd-playlist_state.o src/src_mpd-playlist_queue.o
src/src_mpd-playlist_vector.o src/src_mpd-playlist_database.o
src/src_mpd-queue.o src/src_mpd-queue_print.o src/src_mpd-queue_save.o
src/src_mpd-replay_gain_config.o src/src_mpd-replay_gain_info.o
src/src_mpd-sig_handlers.o src/src_mpd-song.o src/src_mpd-song_update.o
src/src_mpd-song_print.o src/src_mpd-song_save.o src/src_mpd-songvec.o
src/src_mpd-socket_util.o src/src_mpd-state_file.o src/src_mpd-stats.o
src/src_mpd-tag.o src/src_mpd-tag_pool.o src/src_mpd-tag_print.o
src/src_mpd-tag_save.o src/src_mpd-tokenizer.o src/src_mpd-text_file.o
src/src_mpd-text_input_stream.o src/src_mpd-strset.o src/src_mpd-uri.o
src/src_mpd-utils.o src/src_mpd-volume.o src/src_mpd-locate.o
src/src_mpd-stored_playlist.o src/src_mpd-timer.o src/src_mpd-inotify_source.o
src/src_mpd-inotify_queue.o src/src_mpd-inotify_update.o      -lnsl -lm        
  -lFLAC -lm                   -lFLAC -lm             -pthread -lgthread-2.0
-lglib-2.0 -lintl   
/home/test/outputs/test-380/host/usr/i386-unknown-linux-uclibc/sysroot/lib/libstdc++.so:
undefined reference to `___tls_get_addr'
collect2: ld returned 1 exit status
make[2]: *** [src/mpd] Error 1
make[2]: Leaving directory `/home/test/outputs/test-380/build/mpd-0.16.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/outputs/test-380/build/mpd-0.16.1'
make: *** [/home/test/outputs/test-380/build/mpd-0.16.1/.stamp_built] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
